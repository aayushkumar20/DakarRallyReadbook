import { DakarStage, TelemetryData } from '../models/DakarModels';
import { TelemetryManager } from '../services/TelemetryManager';
import { Unik4CockpitView } from '../views/Unik4CockpitView';
import { RoadbookTableView } from '../views/RoadbookTableView';
import { RemoteControlBar } from '../views/RemoteControlBar';
import { LexiconDialog } from '../views/LexiconDialog';

@Entry
@Component
struct Index {
  @State stage: DakarStage = TelemetryManager.defaultStage;
  @State activeNoteIndex: number = 0;
  @State viewMode: string = 'split'; // 'split' | 'unik4' | 'roadbook'

  @State totalOdoKM: number = 12.40;
  @State partialOdoKM: number = 12.40;

  @State telemetry: TelemetryData = {
    speedKmh: 78.4,
    speedUnit: 'km/h',
    headingDeg: 74,
    latitude: 26.6136,
    longitude: 37.9244,
    altitudeM: 685,
    slopeDeg: 3.5,
    totalOdoKM: 12.40,
    partialOdoKM: 12.40,
    validatedCount: 1,
    targetWptNum: 2,
    targetWptName: 'WPM 01 (CANYON EXIT)',
    dtwKM: 6.0,
    ctwDeg: 82,
    activeSpeedLimit: 100,
    isSpeedExceeded: false,
    elapsedSeconds: 580,
    maxSpeedKmh: 124.6,
    avgSpeedKmh: 76.8
  };

  private timerId: number = -1;

  lexiconDialogController: CustomDialogController = new CustomDialogController({
    builder: LexiconDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Center
  });

  aboutToAppear(): void {
    // Start chrono and simulation ticker
    this.timerId = setInterval(() => {
      this.telemetry.elapsedSeconds += 1;
      const delta = (this.telemetry.speedKmh / 3600);
      this.totalOdoKM += delta;
      this.partialOdoKM += delta;
      this.telemetry.totalOdoKM = this.totalOdoKM;
      this.telemetry.partialOdoKM = this.partialOdoKM;
      if (this.telemetry.elapsedSeconds > 0) {
        this.telemetry.avgSpeedKmh = this.telemetry.totalOdoKM / (this.telemetry.elapsedSeconds / 3600);
      }
    }, 1000);
  }

  aboutToDisappear(): void {
    if (this.timerId !== -1) {
      clearInterval(this.timerId);
    }
  }

  build() {
    Column() {
      // Top Cockpit Bar
      Row() {
        // Dakar Logo & Title
        Row() {
          Text('DAKAR')
            .fontSize(16)
            .fontWeight(FontWeight.Bolder)
            .fontColor('#FFE500')
          Text('RALLY')
            .fontSize(16)
            .fontWeight(FontWeight.Bolder)
            .fontColor('#FFFFFF')
            .margin({ left: 4 })
        }

        // View Mode Selector
        Row() {
          Button('SPLIT')
            .fontSize(9)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(this.viewMode === 'split' ? '#FFE500' : '#252834')
            .fontColor(this.viewMode === 'split' ? '#000000' : '#FFFFFF')
            .height(28)
            .onClick(() => { this.viewMode = 'split'; })

          Button('UNIK4')
            .fontSize(9)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(this.viewMode === 'unik4' ? '#FFE500' : '#252834')
            .fontColor(this.viewMode === 'unik4' ? '#000000' : '#FFFFFF')
            .height(28)
            .margin({ left: 3 })
            .onClick(() => { this.viewMode = 'unik4'; })

          Button('ROADBOOK')
            .fontSize(9)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(this.viewMode === 'roadbook' ? '#FFE500' : '#252834')
            .fontColor(this.viewMode === 'roadbook' ? '#000000' : '#FFFFFF')
            .height(28)
            .margin({ left: 3 })
            .onClick(() => { this.viewMode = 'roadbook'; })
        }

        // Action Buttons (Lexicon)
        Button('📖 LEXICON')
          .fontSize(9)
          .fontWeight(FontWeight.Bold)
          .backgroundColor('#1E88E5')
          .fontColor('#FFFFFF')
          .height(28)
          .onClick(() => {
            this.lexiconDialogController.open();
          })
      }
      .width('100%')
      .height(44)
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 10, right: 10 })
      .backgroundColor('#121316')
      .border({ width: { bottom: 1 }, color: '#2B2E38' })

      // Main Content Area
      Column() {
        if (this.viewMode === 'split') {
          // Upper half Unik4 GPS
          Unik4CockpitView({ telemetry: this.telemetry })
            .width('100%')

          // Lower half Roadbook
          RoadbookTableView({
            notes: this.stage.notes,
            activeNoteIndex: $activeNoteIndex
          })
          .layoutWeight(1)
          .width('100%')
        } else if (this.viewMode === 'unik4') {
          Unik4CockpitView({ telemetry: this.telemetry })
            .layoutWeight(1)
            .width('100%')
        } else {
          RoadbookTableView({
            notes: this.stage.notes,
            activeNoteIndex: $activeNoteIndex
          })
          .layoutWeight(1)
          .width('100%')
        }
      }
      .layoutWeight(1)
      .width('100%')

      // Bottom Télécommande Remote Bar
      RemoteControlBar({
        totalOdo: $totalOdoKM,
        partialOdo: $partialOdoKM,
        currentNoteIndex: $activeNoteIndex
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')
  }
}

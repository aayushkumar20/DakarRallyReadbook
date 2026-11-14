import { TelemetryData } from '../models/DakarModels';

@Component
export struct Unik4CockpitView {
  @Prop telemetry: TelemetryData;

  build() {
    Column() {
      // Top Hardware Bezel Plate
      Row() {
        Text('MEMO GPS UNIK4 RALLYE RAID')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')

        Text('AUTO/CAMION')
          .fontSize(9)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFE500')

        Circle({ width: 8, height: 8 })
          .fill('#00E676')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 12, right: 12, top: 4, bottom: 4 })
      .backgroundColor('#1A1C20')

      // Main High-Contrast Cockpit Screen
      Column() {
        // Status Row (Speed, Validated, Target Wpt, Cap)
        Row() {
          // Speedometer
          Column() {
            Text('VITESSE')
              .fontSize(8)
              .fontColor('#888888')
            Row() {
              Text(`${Math.round(this.telemetry.speedKmh)}`)
                .fontSize(36)
                .fontWeight(FontWeight.Bolder)
                .fontColor('#00E676')
              Text('km/h')
                .fontSize(10)
                .fontColor('#AAAAAA')
                .margin({ left: 4 })
            }
          }
          .alignItems(HorizontalAlign.Start)

          // Validated Count
          Column() {
            Text('VALIDÉS')
              .fontSize(8)
              .fontColor('#888888')
            Text(`${this.telemetry.validatedCount}/15`)
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
          }

          // Target Waypoint
          Column() {
            Text('POINT VISÉ')
              .fontSize(8)
              .fontColor('#888888')
            Text(`WP ${this.telemetry.targetWptNum}`)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFE500')
          }

          // Compass CAP Heading
          Column() {
            Text('CAP GPS')
              .fontSize(8)
              .fontColor('#000000')
            Text(`${this.telemetry.headingDeg}°`)
              .fontSize(22)
              .fontWeight(FontWeight.Bolder)
              .fontColor('#000000')
          }
          .backgroundColor('#FFE500')
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
          .borderRadius(4)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(8)
        .border({ width: { bottom: 1 }, color: '#2B2E38' })

        // Dual Odometer Row
        Row() {
          // ODO Total
          Column() {
            Text('ODO TOTAL')
              .fontSize(9)
              .fontColor('#AAAAAA')
            Text(this.telemetry.totalOdoKM.toFixed(2))
              .fontSize(28)
              .fontWeight(FontWeight.Bolder)
              .fontColor('#FFFFFF')
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)
          .border({ width: { right: 1 }, color: '#2B2E38' })

          // ODO Partiel
          Column() {
            Text('ODO PARTIEL')
              .fontSize(9)
              .fontColor('#AAAAAA')
            Text(this.telemetry.partialOdoKM.toFixed(2))
              .fontSize(28)
              .fontWeight(FontWeight.Bolder)
              .fontColor('#FFE500')
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)
        }
        .width('100%')
        .padding({ top: 8, bottom: 8 })
        .border({ width: { bottom: 1 }, color: '#2B2E38' })

        // Chrono, V_MOY, V_MAX
        Row() {
          Column() {
            Text('CHRONO')
              .fontSize(8)
              .fontColor('#888888')
            Text(this.formatChrono(this.telemetry.elapsedSeconds))
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
          }

          Column() {
            Text('V_MOY')
              .fontSize(8)
              .fontColor('#888888')
            Text(`${this.telemetry.avgSpeedKmh.toFixed(1)} km/h`)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
          }

          Column() {
            Text('V_MAX')
              .fontSize(8)
              .fontColor('#888888')
            Text(`${this.telemetry.maxSpeedKmh.toFixed(1)} km/h`)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
          }

          Column() {
            Text('DTW')
              .fontSize(8)
              .fontColor('#888888')
            Text(`${this.telemetry.dtwKM.toFixed(1)} km`)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#00E676')
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .padding(6)
      }
      .backgroundColor('#0D0E12')
      .border({ width: 2, color: '#3A3F4D', radius: 4 })
      .margin(6)
    }
    .width('100%')
    .backgroundColor('#000000')
  }

  private formatChrono(secs: number): string {
    const h = Math.floor(secs / 3600);
    const m = Math.floor((secs % 3600) / 60);
    const s = secs % 60;
    const pad = (n: number) => n < 10 ? `0${n}` : `${n}`;
    return `${pad(h)}:${pad(m)}:${pad(s)}`;
  }
}

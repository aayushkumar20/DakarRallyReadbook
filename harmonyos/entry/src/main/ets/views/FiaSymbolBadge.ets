import { FIALexicon, LexiconItem } from '../models/FIALexicon';
import { WaypointType } from '../models/DakarModels';

@Component
export struct FiaSymbolBadge {
  @Prop code: string;

  build() {
    Row() {
      Text(this.code)
        .fontSize(10)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#000000')

      Text(this.getLabel())
        .fontSize(9)
        .fontWeight(FontWeight.Normal)
        .fontColor('#222222')
        .margin({ left: 3 })
    }
    .padding({ left: 5, right: 5, top: 2, bottom: 2 })
    .backgroundColor(this.getBackgroundColor())
    .border({ width: 1, color: this.getBorderColor(), radius: 3 })
    .margin({ right: 4, bottom: 3 })
  }

  private getLabel(): string {
    const item = FIALexicon.getItem(this.code);
    return item ? item.en : this.code;
  }

  private getBackgroundColor(): string {
    const c = this.code.toUpperCase();
    if (c === 'HP') return '#FFE0B2';
    if (c === 'DN' || c.startsWith('DN') || c === 'SA') return '#FFF9C4';
    if (c === 'DZ') return '#C8E6C9';
    if (c === 'FZ' || c === 'END_SL') return '#CFD8DC';
    if (c === 'PP' || c === '2X' || c === 'RD' || c === 'G^D') return '#BBDEFB';
    if (c === 'CP') return '#E1BEE7';
    if (c.includes('!') || c.startsWith('SL')) return '#FFCDD2';
    return '#EEE';
  }

  private getBorderColor(): string {
    const c = this.code.toUpperCase();
    if (c === 'HP') return '#E65100';
    if (c === 'DN' || c.startsWith('DN') || c === 'SA') return '#FBC02D';
    if (c === 'DZ') return '#2E7D32';
    if (c === 'FZ' || c === 'END_SL') return '#546E7A';
    if (c === 'PP' || c === '2X' || c === 'RD' || c === 'G^D') return '#1976D2';
    if (c === 'CP') return '#7B1FA2';
    if (c.includes('!') || c.startsWith('SL')) return '#C62828';
    return '#444';
  }
}

@Component
export struct WaypointStampComponent {
  @Prop wptType: WaypointType;
  @Prop wptName: string;

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Text(this.getStampText())
        .fontSize(8)
        .fontWeight(FontWeight.Bolder)
        .fontColor(this.getTextColor())
    }
    .width(26)
    .height(26)
    .borderRadius(13)
    .backgroundColor(this.getBgColor())
    .border({ width: 1.5, color: this.getBorderColor() })
    .margin({ right: 6 })
  }

  private getStampText(): string {
    switch (this.wptType) {
      case WaypointType.START: return 'START';
      case WaypointType.FINISH: return 'ASS';
      case WaypointType.DZ: return 'DZ';
      case WaypointType.FZ: return 'FZ';
      case WaypointType.CP: return 'CP';
      case WaypointType.WPC: return 'WPC';
      case WaypointType.WPS: return 'WPS';
      case WaypointType.WPM: return 'WPM';
      default: return this.wptType;
    }
  }

  private getBgColor(): string {
    switch (this.wptType) {
      case WaypointType.START: return '#000000';
      case WaypointType.FINISH: return '#000000';
      case WaypointType.DZ: return '#2E7D32';
      case WaypointType.FZ: return '#546E7A';
      case WaypointType.CP: return '#FFFFFF';
      default: return '#FFFFFF';
    }
  }

  private getTextColor(): string {
    switch (this.wptType) {
      case WaypointType.START: return '#FFE500';
      case WaypointType.FINISH: return '#FFFFFF';
      case WaypointType.DZ: return '#FFFFFF';
      case WaypointType.FZ: return '#FFFFFF';
      case WaypointType.CP: return '#7B1FA2';
      default: return '#000000';
    }
  }

  private getBorderColor(): string {
    switch (this.wptType) {
      case WaypointType.START: return '#000000';
      case WaypointType.FINISH: return '#000000';
      case WaypointType.DZ: return '#2E7D32';
      case WaypointType.FZ: return '#546E7A';
      case WaypointType.CP: return '#7B1FA2';
      default: return '#000000';
    }
  }
}

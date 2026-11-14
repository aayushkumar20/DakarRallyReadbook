import { RoadbookNote, TurnType } from '../models/DakarModels';

@Component
export struct TulipVectorComponent {
  @Prop note: RoadbookNote;
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Canvas(this.context)
        .width('100%')
        .height(98)
        .backgroundColor('#FFFFFF')
        .onReady(() => {
          this.drawTulip();
        })

      if (this.note.cap > 0) {
        Text(`CAP ${this.note.cap}°`)
          .fontSize(11)
          .fontWeight(FontWeight.Bolder)
          .fontColor('#000000')
          .backgroundColor('#FFE500')
          .padding({ left: 4, right: 4, top: 2, bottom: 2 })
          .border({ width: 1, color: '#000000' })
          .margin({ top: 4, right: 4 })
      }
    }
    .width(160)
    .height(98)
  }

  private drawTulip(): void {
    const ctx = this.context;
    ctx.clearRect(0, 0, 160, 98);

    ctx.strokeStyle = '#000000';
    ctx.lineWidth = 3.5;
    ctx.lineCap = 'round';

    if (this.note.isOffTrack) {
      ctx.setLineDash([5, 4]);
    } else {
      ctx.setLineDash([]);
    }

    ctx.beginPath();
    ctx.moveTo(80, 85);

    switch (this.note.turnType) {
      case TurnType.STRAIGHT:
        ctx.lineTo(80, 20);
        ctx.stroke();
        this.drawArrow(80, 20, 0);
        break;
      case TurnType.RIGHT:
        ctx.lineTo(80, 50);
        ctx.lineTo(135, 50);
        ctx.stroke();
        this.drawArrow(135, 50, 90);
        break;
      case TurnType.LEFT:
        ctx.lineTo(80, 50);
        ctx.lineTo(25, 50);
        ctx.stroke();
        this.drawArrow(25, 50, 270);
        break;
      case TurnType.SLIGHT_RIGHT:
        ctx.lineTo(80, 55);
        ctx.lineTo(125, 25);
        ctx.stroke();
        this.drawArrow(125, 25, 45);
        break;
      case TurnType.SLIGHT_LEFT:
        ctx.lineTo(80, 55);
        ctx.lineTo(35, 25);
        ctx.stroke();
        this.drawArrow(35, 25, 315);
        break;
      default:
        ctx.lineTo(80, 20);
        ctx.stroke();
        this.drawArrow(80, 20, 0);
        break;
    }
  }

  private drawArrow(x: number, y: number, angleDeg: number): void {
    const ctx = this.context;
    ctx.save();
    ctx.translate(x, y);
    ctx.rotate((angleDeg * Math.PI) / 180);
    ctx.fillStyle = '#000000';
    ctx.beginPath();
    ctx.moveTo(0, -6);
    ctx.lineTo(-5, 6);
    ctx.lineTo(5, 6);
    ctx.closePath();
    ctx.fill();
    ctx.restore();
  }
}

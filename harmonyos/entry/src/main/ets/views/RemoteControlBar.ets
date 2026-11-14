@Component
export struct RemoteControlBar {
  @Link totalOdo: number;
  @Link partialOdo: number;
  @Link currentNoteIndex: number;
  private maxNotes: number = 15;

  build() {
    Row() {
      // ESC
      Button('ESC')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#D32F2F')
        .fontColor('#FFFFFF')
        .height(36)
        .layoutWeight(1)
        .margin({ right: 3 })

      // TRIP RST
      Button('TRIP RST')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#7B1FA2')
        .fontColor('#FFFFFF')
        .height(36)
        .layoutWeight(1.2)
        .margin({ right: 3 })
        .onClick(() => {
          this.partialOdo = 0.0;
        })

      // -0.10
      Button('-0.10')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#424242')
        .fontColor('#FFFFFF')
        .height(36)
        .layoutWeight(1)
        .margin({ right: 3 })
        .onClick(() => {
          this.totalOdo = Math.max(0, this.totalOdo - 0.10);
        })

      // +0.10
      Button('+0.10')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#424242')
        .fontColor('#FFFFFF')
        .height(36)
        .layoutWeight(1)
        .margin({ right: 3 })
        .onClick(() => {
          this.totalOdo += 0.10;
        })

      // NOTE -
      Button('NOTE -')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#1976D2')
        .fontColor('#FFFFFF')
        .height(36)
        .layoutWeight(1.1)
        .margin({ right: 3 })
        .onClick(() => {
          if (this.currentNoteIndex > 0) {
            this.currentNoteIndex -= 1;
          }
        })

      // NOTE +
      Button('NOTE +')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#1976D2')
        .fontColor('#FFFFFF')
        .height(36)
        .layoutWeight(1.1)
        .margin({ right: 3 })
        .onClick(() => {
          if (this.currentNoteIndex < this.maxNotes - 1) {
            this.currentNoteIndex += 1;
          }
        })

      // OK / VALIDATE
      Button('OK')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#2E7D32')
        .fontColor('#FFFFFF')
        .height(36)
        .layoutWeight(1)
    }
    .width('100%')
    .height(48)
    .padding({ left: 6, right: 6, top: 6, bottom: 6 })
    .backgroundColor('#121316')
    .border({ width: { top: 1 }, color: '#2B2E38' })
  }
}

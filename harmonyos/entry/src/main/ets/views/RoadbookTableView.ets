import { RoadbookNote } from '../models/DakarModels';
import { TulipVectorComponent } from './TulipVectorComponent';
import { FiaSymbolBadge, WaypointStampComponent } from './FiaSymbolBadge';

@Component
export struct RoadbookTableView {
  @Prop notes: RoadbookNote[];
  @Link activeNoteIndex: number;
  private scroller: Scroller = new Scroller();

  build() {
    Column() {
      // Header
      Row() {
        Text('DISTANCES')
          .width(110)
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .textAlign(TextAlign.Center)

        Text('DIAGRAMME TULIPE')
          .width(160)
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .textAlign(TextAlign.Center)

        Text('NOTES / SYMBOLES FIA')
          .layoutWeight(1)
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .padding({ left: 8 })
      }
      .width('100%')
      .height(34)
      .backgroundColor('#1A1C22')
      .border({ width: { bottom: 1 }, color: '#333333' })

      // Rows List
      List({ scroller: this.scroller }) {
        ForEach(this.notes, (note: RoadbookNote, index: number) => {
          ListItem() {
            Row() {
              // Col 1: Distance
              Column() {
                Text(note.totalKM.toFixed(2))
                  .fontSize(22)
                  .fontWeight(FontWeight.Bolder)
                  .fontColor('#000000')

                Row() {
                  Text(`#${note.id}`)
                    .fontSize(10)
                    .fontWeight(FontWeight.Bolder)
                    .fontColor('#FFFFFF')
                    .backgroundColor('#000000')
                    .padding({ left: 4, right: 4, top: 1, bottom: 1 })
                    .borderRadius(2)

                  Text(note.partialKM.toFixed(2))
                    .fontSize(14)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#000000')
                    .margin({ left: 6 })
                }
                .margin({ top: 4 })

                if (note.wptName) {
                  Text(note.wptName)
                    .fontSize(8.5)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#555555')
                    .margin({ top: 3 })
                    .maxLines(1)
                }
              }
              .width(110)
              .height(98)
              .padding(6)
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(HorizontalAlign.End)
              .border({ width: { right: 2 }, color: '#000000' })
              .backgroundColor(index === this.activeNoteIndex ? '#E3F2FD' : '#FFFFFF')

              // Col 2: Tulip Diagram
              TulipVectorComponent({ note: note })
                .border({ width: { right: 2 }, color: '#000000' })

              // Col 3: FIA Lexicon & Notes
              Column() {
                // Top row stamps and dangers
                Row() {
                  WaypointStampComponent({ wptType: note.wptType, wptName: note.wptName })

                  if (note.danger > 0) {
                    Text('!'.repeat(note.danger))
                      .fontSize(22)
                      .fontWeight(FontWeight.Bolder)
                      .fontColor('#D32F2F')
                      .margin({ right: 6 })
                  }

                  if (note.speedLimit) {
                    Stack({ alignContent: Alignment.Center }) {
                      Text(`${note.speedLimit}`)
                        .fontSize(10)
                        .fontWeight(FontWeight.Bolder)
                        .fontColor('#000000')
                    }
                    .width(24)
                    .height(24)
                    .borderRadius(12)
                    .backgroundColor('#FFFFFF')
                    .border({ width: 2.5, color: '#D32F2F' })
                    .margin({ right: 6 })
                  }
                }
                .width('100%')

                // Lexicon tag pills
                Flex({ wrap: FlexWrap.Wrap }) {
                  ForEach(note.lexicon, (code: string) => {
                    FiaSymbolBadge({ code: code })
                  })
                }
                .margin({ top: 4 })

                // Instruction comment
                Text(note.text)
                  .fontSize(10)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#000000')
                  .margin({ top: 4 })
                  .maxLines(2)
              }
              .layoutWeight(1)
              .height(98)
              .padding(6)
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.SpaceBetween)
              .backgroundColor(index === this.activeNoteIndex ? '#E3F2FD' : '#FFFFFF')
            }
            .width('100%')
            .border({ width: { bottom: 2 }, color: '#000000' })
            .onClick(() => {
              this.activeNoteIndex = index;
            })
          }
        })
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')
  }
}

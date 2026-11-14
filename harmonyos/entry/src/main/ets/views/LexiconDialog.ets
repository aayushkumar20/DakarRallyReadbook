import { FIALexicon, LexiconItem } from '../models/FIALexicon';
import { FiaSymbolBadge } from './FiaSymbolBadge';

@CustomDialog
export struct LexiconDialog {
  controller: CustomDialogController;
  @State searchText: string = '';
  @State selectedCategory: string = 'all';

  private categories: string[] = [
    'all', 'tracks', 'elements', 'areas', 'safety', 'waypoints', 'directions', 'specificities', 'electric'
  ];

  build() {
    Column() {
      // Header
      Row() {
        Text('📖 FIA DAKAR SYMBOL LEXICON')
          .fontSize(14)
          .fontWeight(FontWeight.Bolder)
          .fontColor('#FFFFFF')

        Button('✕')
          .fontSize(14)
          .fontColor('#FFFFFF')
          .backgroundColor('transparent')
          .onClick(() => {
            this.controller.close();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(10)
      .border({ width: { bottom: 1 }, color: '#2B2E38' })

      // Category filter tabs
      Scroll() {
        Row() {
          ForEach(this.categories, (cat: string) => {
            Button(cat.toUpperCase())
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .backgroundColor(this.selectedCategory === cat ? '#FFE500' : '#252834')
              .fontColor(this.selectedCategory === cat ? '#000000' : '#FFFFFF')
              .height(28)
              .margin({ right: 4 })
              .onClick(() => {
                this.selectedCategory = cat;
              })
          })
        }
        .padding({ left: 8, right: 8, top: 6, bottom: 6 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')

      // Search bar
      TextInput({ placeholder: 'Search FIA signs, codes, or descriptions...' })
        .fontSize(12)
        .placeholderColor('#777777')
        .fontColor('#FFFFFF')
        .backgroundColor('#1A1C22')
        .border({ width: 1, color: '#3A3F4D', radius: 4 })
        .margin({ left: 10, right: 10, top: 4, bottom: 8 })
        .onChange((value: string) => {
          this.searchText = value;
        })

      // Items list
      List() {
        ForEach(this.getFilteredItems(), (item: LexiconItem) => {
          ListItem() {
            Row() {
              FiaSymbolBadge({ code: item.code })

              Column() {
                Text(item.en)
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#FFFFFF')

                Text(item.fr)
                  .fontSize(10)
                  .fontColor('#888888')
                  .margin({ top: 1 })
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
              .margin({ left: 8 })

              Text(item.cat.toUpperCase())
                .fontSize(8.5)
                .fontWeight(FontWeight.Bold)
                .fontColor('#AAAAAA')
                .backgroundColor('#22242D')
                .padding({ left: 4, right: 4, top: 2, bottom: 2 })
                .borderRadius(2)
            }
            .width('100%')
            .padding({ left: 10, right: 10, top: 8, bottom: 8 })
            .border({ width: { bottom: 1 }, color: '#1F222A' })
          }
        })
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('90%')
    .height('80%')
    .backgroundColor('#121316')
    .borderRadius(8)
  }

  private getFilteredItems(): LexiconItem[] {
    const q = this.searchText.trim().toLowerCase();
    return FIALexicon.items.filter((item: LexiconItem) => {
      const matchCat = (this.selectedCategory === 'all' || item.cat === this.selectedCategory);
      if (!matchCat) return false;
      if (!q) return true;
      return item.code.toLowerCase().includes(q) ||
             item.en.toLowerCase().includes(q) ||
             item.fr.toLowerCase().includes(q);
    });
  }
}

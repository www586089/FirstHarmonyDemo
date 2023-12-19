@Entry
@Component
struct GridLayoutPage2 {
  @State array: Array<string> = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

  build() {
    Row() {
      Column() {
        Grid() {
          ForEach(this.array, (item: string, index) => {
            GridItem() {
              Text(item).gridTextStyle_page2('#67c8ff')
            }
          }, item => item)
        }
        .rowsGap(12).columnsGap(8).margin(4).maxCount(3).minCount(3).layoutDirection(GridDirection.Column)
      }
      .width('100%')
    }
    .height('40%')
  }
}

@Extend(Text) function gridTextStyle_page2(value: ResourceColor) {
  .backgroundColor(value)
  .width('30%')
  .height('30%')
  .fontSize(22)
  .textAlign(TextAlign.Center)
}
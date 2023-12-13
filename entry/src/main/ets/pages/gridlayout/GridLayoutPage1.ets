@Entry
@Component
struct GridLayoutPage1 {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Grid() {
          GridItem() {
            Text(`1`).gridTextStyle("#1067c8ff")
          }
          GridItem() {
            Text(`2`).gridTextStyle("#2067c8ff")
          }
          GridItem() {
            Text(`3`).gridTextStyle("#3067c8ff")
          }
          GridItem() {
            Text(`4`).gridTextStyle("#4067c8ff")
          }
          GridItem() {
            Text(`5`).gridTextStyle("#5067c8ff")
          }
          GridItem() {
            Text(`6`).gridTextStyle("#6067c8ff")
          }
          GridItem() {
            Text(`7`).gridTextStyle("#7067c8ff")
          }
          GridItem() {
            Text(`8`).gridTextStyle("#8067c8ff")
          }
          GridItem() {
            Text(`9`).gridTextStyle("#9067c8ff")
          }
        }
        .rowsTemplate('1fr 1fr 1fr')
        .columnsTemplate('1fr 2fr 1fr')
      }
      .width('100%')
    }
    .height('40%')
  }
}

@Extend(Text) function gridTextStyle(value: ResourceColor) {
  .backgroundColor(value)
  .width('100%')
  .height('100%')
  .fontSize(22)
  .textAlign(TextAlign.Center)
}
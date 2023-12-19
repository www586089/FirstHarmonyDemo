@Entry
@Component
struct CalculatorLayoutPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Grid() {
          GridItem() {
            Text(`0`).gridTextStyle2("#1067c8ff").textAlign(TextAlign.End).padding(2)
          }.rowStart(0).rowEnd(1).columnStart(0).columnEnd(3)
          GridItem() {
            Text(`CE`).gridTextStyle2("#2067c8ff")
          }
          GridItem() {
            Text(`C`).gridTextStyle2("#3067c8ff")
          }
          GridItem() {
            Text(`/`).gridTextStyle2("#4067c8ff")
          }
          GridItem() {
            Text(`X`).gridTextStyle2("#5067c8ff")
          }
          GridItem() {
            Text(`7`).gridTextStyle2("#6067c8ff")
          }
          GridItem() {
            Text(`8`).gridTextStyle2("#7067c8ff")
          }
          GridItem() {
            Text(`9`).gridTextStyle2("#8067c8ff")
          }
          GridItem() {
            Text(`-`).gridTextStyle2("#9067c8ff")
          }
          GridItem() {
            Text(`4`).gridTextStyle2("#A067c8ff")
          }
          GridItem() {
            Text(`5`).gridTextStyle2("#B067c8ff")
          }
          GridItem() {
            Text(`6`).gridTextStyle2("#C067c8ff")
          }
          GridItem() {
            Text(`+`).gridTextStyle2("#D067c8ff")
          }
          GridItem() {
            Text(`1`).gridTextStyle2("#E067c8ff")
          }
          GridItem() {
            Text(`2`).gridTextStyle2("#F067c8ff")
          }
          GridItem() {
            Text(`3`).gridTextStyle2("#F167c8ff")
          }
          GridItem() {
            Text(`=`).gridTextStyle2("#F267c8ff")
          }.rowStart(5).rowEnd(6).columnStart(3).columnEnd(3)

          GridItem() {
            Text(`0`).gridTextStyle2("#F367c8ff")
          }.columnStart(0).columnEnd(1)
          GridItem() {
            Text(`.`).gridTextStyle2("#F467c8ff")
          }
        }
        .margin(12)
        .rowsGap(12)
        .columnsGap(8)
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
        .columnsTemplate('1fr 1fr 1fr 1fr')
      }
      .width('100%')
    }
    .height('80%')
  }
}

@Extend(Text) function gridTextStyle2(value: ResourceColor) {
  .backgroundColor(value)
  .width('100%')
  .height('100%')
  .fontSize(40)
  .textAlign(TextAlign.Center)
  .borderRadius(5)
}
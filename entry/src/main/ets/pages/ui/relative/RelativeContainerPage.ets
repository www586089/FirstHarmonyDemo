@Entry
@Component
struct RelativeContainerPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      RelativeContainerView()
    }
    .height('100%')
  }
}

@Component
struct RelativeContainerView {
  build() {
    RelativeContainer() {
      Row()
        // 添加其他属性
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        }).width('20%').height(100)
        .id("row11").backgroundColor("#ff0000")

      Row()
      .alignRules({
        top: { anchor: '__container__', align: VerticalAlign.Top },
        right: { anchor: '__container__', align: HorizontalAlign.End }
      }).width('20%').height(100)
        .id("row22").backgroundColor("#ffcc00")

      Row()
        .margin({top: 12})
        .alignRules({
          top: { anchor: 'row1', align: VerticalAlign.Bottom }
        }).width('20%').height(100)
        .id("row3").backgroundColor("#ffcc00")

      Row()
        .margin({top: 0})
        .alignRules({
          top: { anchor: 'row1', align: VerticalAlign.Top },
          middle: {anchor: 'row1', align: HorizontalAlign.Center}
        }).width('2%').height(100)
        .id("row4").backgroundColor(Color.Black)
    }.width('100%').height('100%')
  }
}
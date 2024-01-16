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

      Text('Anchor')
        .backgroundColor('#aa67c8ff')
        .id('anchor')
        .width('40%')
        .textAlign(TextAlign.Center)
        .height(48)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Column()
        .alignRules({
          bottom: { anchor: 'anchor', align: VerticalAlign.Bottom }
        })
        .width('100%')
        .height(12)
        .backgroundColor('#80ff0000')
        .id('vLine')
    }
    .width('100%')
    .height('20%')
    .backgroundColor('#999')
    .alignSelf(ItemAlign.Start)
  }
}
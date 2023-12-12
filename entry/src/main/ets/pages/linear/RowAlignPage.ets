@Entry
@Component
struct RowAlignPage {
  @State message: string = 'Hello World'

  build() {
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)

      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)

      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).alignItems(VerticalAlign.Bottom).backgroundColor('rgb(242,242,242)')
  }
}
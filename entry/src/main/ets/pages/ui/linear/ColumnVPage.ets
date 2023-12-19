@Entry
@Component
struct ColumnVPage {
  @State message: string = 'Hello World'

  build() {
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)

      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)

      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').height(300).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.Center)
  }
}
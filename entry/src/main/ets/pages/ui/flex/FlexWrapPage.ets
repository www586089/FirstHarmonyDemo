@Entry
@Component
struct FlexWrapPage {
  @State message: string = 'Hello World'

  build() {
    Flex({ wrap: FlexWrap.NoWrap }) {
      Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
      Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
      Text('3').width('50%').height(50).backgroundColor(0xF5DEB3)
    }
    .width('90%')
    .padding(10)
    .backgroundColor(0xAFEEEE)
  }
}
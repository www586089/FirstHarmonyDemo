@Entry
@Component
struct FlexChildAlign {
  @State message: string = 'Hello World'

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
      Text('2').width('20%').height(50).backgroundColor(0xD2B48C)
      Text('3').width('20%').height(50).backgroundColor(0xF5DEB3)
    }
    .width('90%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor(0xAFEEEE)
  }
}
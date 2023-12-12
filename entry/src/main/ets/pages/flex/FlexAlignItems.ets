@Entry
@Component
//容器组件设置交叉轴对齐
struct FlexAlignItems {
  @State message: string = 'Hello World'

  build() {
    Flex({ alignItems: ItemAlign.Baseline }) {
      Text('1').width('33%').height(30).backgroundColor(0xF5DEB3)
      Text('2').width('33%').height(40).backgroundColor(0xD2B48C)
      Text('3').width('33%').height(50).backgroundColor(0xF5DEB3)
    }
    .size({ width: '90%', height: 80 })
    .padding(10)
    .backgroundColor(0xAFEEEE)
  }
}
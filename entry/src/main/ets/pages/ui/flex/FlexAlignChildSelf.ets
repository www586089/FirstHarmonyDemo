@Entry
@Component
//子组件设置交叉轴对齐
struct FlexAlignChildSelf {
  @State message: string = 'Hello World'

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) { // 容器组件设置子组件居中
      Text('alignSelf Start').width('25%').height(80)
        .alignSelf(ItemAlign.Start)
        .backgroundColor(0xF5DEB3)
      Text('alignSelf Baseline')
        .alignSelf(ItemAlign.Baseline)
        .width('25%')
        .height(80)
        .backgroundColor(0xD2B48C)
      Text('alignSelf Baseline').width('25%').height(100)
        .backgroundColor(0xF5DEB3)
        .alignSelf(ItemAlign.Baseline)
      Text('no alignSelf').width('25%').height(100)
        .backgroundColor(0xD2B48C)
      Text('no alignSelf').width('25%').height(100)
        .backgroundColor(0xF5DEB3)

    }.width('90%').height(220).backgroundColor(0xAFEEEE)
  }
}
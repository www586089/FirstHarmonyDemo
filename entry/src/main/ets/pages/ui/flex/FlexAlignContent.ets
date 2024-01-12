@Entry
@Component
struct FlexAlignContent {
  @State message: string = 'Hello World'

  build() {
    Flex({
      justifyContent: FlexAlign.SpaceBetween,  //设置在主轴方向的对齐方式
      wrap: FlexWrap.Wrap,                     //换行
      alignContent: FlexAlign.End,             //设置子组件各行在交叉轴剩余空间内的对齐方式，只在多行的flex布局中生效
      // alignItems: ItemAlign.Start             //设置子组件在交叉轴的对齐方式
    }) {
      Text('1').width('30%').height(20).backgroundColor(0xF5DEB3)
      Text('2').width('60%').height(20).backgroundColor(0xD2B48C)
      Text('3').width('40%').height(20).backgroundColor(0xD2B48C)
      Text('4').width('30%').height(20).backgroundColor(0xF5DEB3)
      Text('5').width('20%').height(20).backgroundColor(0xD2B48C)
    }
    .width('90%')
    .height(100)
    .backgroundColor(0xAFEEEE)
  }
}
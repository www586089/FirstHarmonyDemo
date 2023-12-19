@Entry
@Component
struct FlexStrech {
  @State message: string = 'Hello World'

  build() {
    Flex() {
      Text('flexBasis("auto")')
        .flexBasis('auto') // 未设置width以及flexBasis值为auto，内容自身宽松
        .height(100)
        .backgroundColor(0xF5DEB3)
      Text('flexBasis("auto")' + ' width("40%")')
        .width('40%')
        .flexBasis('auto') //设置width以及flexBasis值auto，使用width的值
        .height(100)
        .backgroundColor(0xD2B48C)

      Text('flexBasis(100)') // 未设置width以及flexBasis值为100，宽度为100vp
        .fontSize(15)
        .flexBasis(100)
        .height(100)
        .backgroundColor(0xF5DEB3)

      Text('flexBasis(100)')
        .fontSize(15)
        .flexBasis(100)
        .width(200) // flexBasis值为100，覆盖width的设置值，宽度为100vp
        .height(100)
        .backgroundColor(0xD2B48C)
    }.width('90%').height(120).padding(10).backgroundColor(0xAFEEEE)
  }
}
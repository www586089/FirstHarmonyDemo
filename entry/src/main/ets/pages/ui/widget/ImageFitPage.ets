@Entry
@Component
struct ImageFitPage {
  private scroller: Scroller = new Scroller()

  build() {
    Scroll(this.scroller) {
      Column({space: 8}) {
        Text('1 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内').fontSize(12).fontColor(Color.White)
        Image($r("app.media.girl1"))
          .interpolation(ImageInterpolation.Low)
          .width(300).height(300).border({ width: 1 }).objectFit(ImageFit.Contain)
          .overlay('Contain', { align: Alignment.Bottom, offset: { x: 0, y: -20 } })

        Text('2 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。').fontSize(12).fontColor(Color.White)
        Image($r("app.media.girl1"))
          .width(300).height(300).border({ width: 1 }).objectFit(ImageFit.Cover)
          .overlay('Cover', { align: Alignment.Bottom, offset: { x: 0, y: -20 } })
        Text('3  自适应显示。').fontSize(12).fontColor(Color.White)
        Image($r("app.media.girl1"))
          .width(300).height(300).border({ width: 1 }).objectFit(ImageFit.Auto)
          .overlay('Auto', { align: Alignment.Bottom, offset: { x: 0, y: -20 } })
        Text('4 不保持宽高比进行放大缩小，使得图片充满显示边界。').fontSize(12).fontColor(Color.White)
        Image($r("app.media.girl1"))
          .width(300).height(300).border({ width: 1 }).objectFit(ImageFit.Fill)
          .overlay('Fill', { align: Alignment.Bottom, offset: { x: 0, y: -20 } })

        Text('5 保持宽高比显示，图片缩小或者保持不变。').fontSize(12).fontColor(Color.White)
        Image($r("app.media.girl1"))
          .width(300).height(300).border({ width: 1 }).objectFit(ImageFit.ScaleDown)
          .overlay('ScaleDown', { align: Alignment.Bottom, offset: { x: 0, y: -20 } })
        Text('6 保持原有尺寸显示。').fontSize(12).fontColor(Color.White)
        Image($r("app.media.girl1"))
          .width(300).height(300).border({ width: 1 }).objectFit(ImageFit.None)
          .overlay('None', { align: Alignment.Bottom, offset: { x: 0, y: -20 } })

        Image($r("app.media.girl1"))
          // .interpolation(ImageInterpolation.High)
          .sourceSize({width: 354, height: 200})//解码尺寸
          .width(300).height(300).border({ width: 1 }).objectFit(ImageFit.None)
          .overlay('None', { align: Alignment.Bottom, offset: { x: 0, y: -20 } })

        Image($r("app.media.girl1"))
          .width(300).height(300).border({ width: 1 }).objectFit(ImageFit.None)
          .colorFilter(
            [1, 1, 0, 0, 0,
              0, 1, 0, 0, 0,
              0, 0, 1, 0, 0,
              0, 0, 0, 1, 0])
          .overlay('None', { align: Alignment.Bottom, offset: { x: 0, y: -20 } })
          // .onComplete((msg: {
          //   width: number,
          //   height: number,
          //   componentWidth: number,
          //   componentHeight: number
          // }) => {
          //   this.widthValue = msg.width
          //   this.heightValue = msg.height
          //   this.componentWidth = msg.componentWidth
          //   this.componentHeight = msg.componentHeight
          // })
            // 图片获取失败，打印结果
          .onError(() => {
            console.info('load image fail')
          })
      }.padding(8)
      .width('100%')
      .backgroundColor("#67c8ff")
      .justifyContent(FlexAlign.Center)
      .borderRadius(6)
    }
    .padding(12)
    .align(Alignment.TopStart)
    .height("100%")
    .backgroundColor(0xDCDCDC)
    .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Transparent) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
  }
}
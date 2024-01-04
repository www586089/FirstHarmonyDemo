@Entry
@Component
struct ImageRepeatTestPage {
  @State message: string = 'Hello World'

  build() {
    Column({ space: 10 }) {
      Column({ space: 5 }) {
        Image($r('app.media.wrench_simple_20'))
          .width('60%')
          .height(300)
          .border({ width: 1 })
          .objectRepeat(ImageRepeat.XY)
          .objectFit(ImageFit.ScaleDown)
          .margin({top: 48})
            // 在水平轴和竖直轴上同时重复绘制图片
          .overlay('ImageRepeat.XY', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($r('app.media.wrench_simple_20'))
          .width('60%')
          .height(300)
          .border({ width: 1 })
          .objectRepeat(ImageRepeat.Y)
          .objectFit(ImageFit.ScaleDown)
          .margin({top: 40})
            // 只在竖直轴上重复绘制图片
          .overlay('ImageRepeat.Y', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($r('app.media.wrench_simple_20'))
          .width('60%')
          .height(300)
          .border({ width: 1 })
          .objectRepeat(ImageRepeat.X)
          .objectFit(ImageFit.ScaleDown)
          .margin({top: 40})
            // 只在水平轴上重复绘制图片
          .overlay('ImageRepeat.X', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
      }
    }.height(150).width('100%').padding(8)
  }
}
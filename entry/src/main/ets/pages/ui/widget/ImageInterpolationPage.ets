@Entry
@Component
struct ImageInterpolationPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Row() {
        Image($r('app.media.wrench_simple_20'))
          .width('40%')
          .interpolation(ImageInterpolation.None)
          .borderWidth(1)
          .overlay("Interpolation.None", { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .margin(10)
        Image($r('app.media.wrench_simple_20'))
          .width('40%')
          .interpolation(ImageInterpolation.Low)
          .borderWidth(1)
          .overlay("Interpolation.Low", { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .margin(10)
      }.width('100%')
      .justifyContent(FlexAlign.Center)

      Row() {
        Image($r('app.media.wrench_simple_20'))
          .width('40%')
          .interpolation(ImageInterpolation.Medium)
          .borderWidth(1)
          .overlay("Interpolation.Medium", { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .margin(10)
        Image($r('app.media.wrench_simple_20'))
          .width('40%')
          .interpolation(ImageInterpolation.High)
          .borderWidth(1)
          .overlay("Interpolation.High", { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .margin(10)
      }.width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .height('100%')
  }
}
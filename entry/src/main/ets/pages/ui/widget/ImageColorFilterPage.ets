@Entry
@Component
struct ImageColorFilterPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Row() {
        Image($r('app.media.girl16'))
          .width('40%')
          .margin(10)
        Image($r('app.media.girl16'))
          .width('40%')
          .colorFilter(
            [1, 1, 0, 0, 0,
              0, 1, 0, 0, 0,
              0, 0, 1, 0, 0,
              0, 0, 0, 1, 0])
          .margin(10)
      }.width('100%')
      .justifyContent(FlexAlign.Center)
    }
  }
}
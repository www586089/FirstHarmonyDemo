@Entry
@Component
struct SVGImageTestPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Image($r('app.media.smile_beam'))
          .width(200)
          .height(200)
          .backgroundColor('#8067c8ff')
          .fillColor(Color.Red)
      }
      .width('100%')
    }
    .height('100%')
  }
}
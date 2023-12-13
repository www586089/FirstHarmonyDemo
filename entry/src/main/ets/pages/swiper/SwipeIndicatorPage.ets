@Entry
@Component
struct SwipeIndicatorPage {
  @State message: string = 'Hello World'

  private swiperController: SwiperController = new SwiperController()

  build() {
    Row() {
      Column() {
        Swiper(this.swiperController) {
          Text("0")
            .width('90%')
            .height('100%')
            .backgroundColor('#1067c8ff')
            .textAlign(TextAlign.Center)
            .fontSize(30)

          Text("1")
            .width('90%')
            .height('100%')
            .backgroundColor('#2067c8ff')
            .textAlign(TextAlign.Center)
            .fontSize(30)

          Text("2")
            .width('90%')
            .height('100%')
            .backgroundColor('#3067c8ff')
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }
        .loop(true).autoPlay(true).interval(2000).indicatorStyle({
          size: 30,
          left: 0,
          color: Color.Red
        })
      }
      .width('100%').height('20%').alignSelf(ItemAlign.Start)
    }
    .height('100%')
  }
}
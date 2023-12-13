@Entry
@Component
struct SwipeControlPage {
  private swiperController: SwiperController = new SwiperController();

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        Text("0")
          .width(250)
          .height(250)
          .backgroundColor("#1067c8ff")
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text("1")
          .width(250)
          .height(250)
          .backgroundColor("#2067c8ff")
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text("2")
          .width(250)
          .height(250)
          .backgroundColor("#3067c8ff")
          .textAlign(TextAlign.Center)
          .fontSize(30)

        Text("3")
          .width(250)
          .height(250)
          .backgroundColor("#3067c8ff")
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text("4")
          .width(250)
          .height(250)
          .backgroundColor("#4067c8ff")
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text("5")
          .width(250)
          .height(250)
          .backgroundColor("#5067c8ff")
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }
      .indicator(true).vertical(false).displayCount(2)

      Row({ space: 12 }) {
        Button('showNext')
          .onClick(() => {
            this.swiperController.showNext(); // 通过controller切换到后一页
          })
        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious(); // 通过controller切换到前一页
          })
      }.margin(5)
    }.width('100%')
    .margin({ top: 5 })
  }
}
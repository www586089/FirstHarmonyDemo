@Entry
@Component
struct TransitionScenePage {
  @State message: string = 'Hello World'
  @State flag: boolean = true

  build() {
    Row() {
      Column() {
        Button(this.flag ? 'Hide': 'Show').fontSize(30).margin(30).width(150).height(50)
          .onClick(() => {
              animateTo({}, () => {
                this.flag = !this.flag
              })
          })
        if (this.flag) {
          Image($r("app.media.girl1")).width(300)
            // .transition({
            //   type: TransitionType.All,
            //   opacity: 1
            // })
            .transition({
              type: TransitionType.Insert,
              translate: {x: 200, y: -200},
              opacity: 0,
              rotate: {angle: 360 }
            })
            .transition({
              type: TransitionType.Delete,
              translate: {x: 200, y: -200},
              opacity: 0,
              rotate: {angle: 360 }
            })
        }
      }
      .width('100%').height('100%')
    }
    .height('100%')
  }
}
@Entry
@Component
struct PropertyAnim1Page {
  @State message: string = 'Hello World'
  @State widthSize: number = 250
  @State heightSize: number = 100
  @State flag: boolean = true
  @State rotateAngle: number = 0

  build() {
    Row() {
      Column() {
        Button('I can Change')
          .onClick(() => {
            if (this.flag) {
              this.widthSize = 150
              this.heightSize = 50
            } else {
              this.widthSize = 250
              this.heightSize = 100
            }
            this.flag = !this.flag
          })
          .fontSize(24)
          .fontColor(Color.White)
          .backgroundColor('#67c8ff')
          .margin(30)
          .width(this.widthSize)
          .height(this.heightSize)
          .animation({
            duration: 2000,
            iterations: 3,
            curve: Curve.Linear,
            playMode: PlayMode.Alternate
          })
          .borderRadius(50)
        Button('ChangeSize')
          .onClick(() => {
            this.rotateAngle = 180
          })
          .width('120')
          .height(44)
          .margin({ top: 120 })
          .rotate({ angle: this.rotateAngle })
          .animation({
            duration: 1000,
            iterations: -1,
            curve: Curve.Linear,
            playMode: PlayMode.Reverse
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
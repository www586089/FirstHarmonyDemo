import curves from '@ohos.curves';

@Entry
@Component
struct SpringTest {
  @State translateX: number = 0;

  private jumpWithSpeed(speed: number) {
    this.translateX = -1;
    animateTo({ duration: 2000, curve: curves.springCurve(speed, 1, 1, 1.2) }, () => {
      // 以指定初速度进行x方向的平移的弹簧动画
      this.translateX = 0;
    })
  }

  build() {
    Column() {
      Button("button")
        .fontSize(14)
        .width(100)
        .height(50)
        .margin(30)
        .translate({ x: this.translateX })
      Row({space:50}) {
        Button("jump 50").fontSize(14)
          .onClick(() => {
            // 以初速度50的弹簧曲线进行平移
            this.jumpWithSpeed(50);
          })
        Button("jump 200").fontSize(14)
          .onClick(() => {
            // 以初速度200的弹簧曲线进行平移
            this.jumpWithSpeed(200);
          })
      }.margin(30)
    }.height('100%').width('100%')
  }
}
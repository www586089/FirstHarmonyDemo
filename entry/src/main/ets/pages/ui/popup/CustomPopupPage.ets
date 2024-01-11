@Entry
@Component
struct CustomPopupPage {
  @State customPopup: boolean = false

  // popup构造器定义弹框内容
  @Builder
  popupBuilder() {
    Row({ space: 2 }) {
      Image($r("app.media.smile_beam"))
        .width(24)
        .height(24)
        .margin({ left: 5 })
      Text('This is Custom Popup')
        .fontSize(15)
    }
    .width(200)
    .height(50)
    .padding(5)
  }

  // popup构造器定义弹框内容
  @Builder popupBuilder2() {
    Row({ space: 2 }) {
      Image('/images/shengWhite.png').width(30).objectFit(ImageFit.Contain)
      Column(){
        Text('控制人生').fontSize(14).fontWeight(900).fontColor(Color.White).width('100%')
        Text('想要跟唱时，数千万歌曲任你选择，人声随心调整。').fontSize(12).fontColor('#ffeeeeee').width('100%')
      }
    }.width(230).height(80).padding(5)
  }

  build() {
    Column() {
      Button('CustomPopupOptions')
        .position({ x: 100, y: 200 })
        .onClick(() => {
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder2,  // 气泡的内容
          placement: Placement.Bottom,  // 气泡的弹出位置
          popupColor: Color.Pink        // 气泡的背景色
        })
    }
    .height('100%')
  }
}
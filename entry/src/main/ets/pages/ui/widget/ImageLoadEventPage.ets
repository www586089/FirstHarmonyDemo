@Entry
@Component
struct ImageLoadEventPage {
  @State widthValue: number = 0
  @State heightValue: number = 0
  @State componentWidth: number = 0
  @State componentHeight: number = 0

  build() {
    Column() {
      Row() {
        Image($r('app.media.girl6'))
          .width(200)
          .height(150)
          .margin(15)
          .objectFit(ImageFit.Contain)
          // .onComplete((msg: {
          //   width: number,
          //   height: number,
          //   componentWidth: number,
          //   componentHeight: number
          // }) => {
          //   this.widthValue = msg.width
          //   this.heightValue = msg.height
          //   this.componentWidth = msg.componentWidth
          //   this.componentHeight = msg.componentHeight
          // })// 图片获取失败，打印结果
          .onError(() => {
            console.info('load image fail')
          })
          .overlay('\nwidth: ' + String(this.widthValue) + ', height: ' + String(this.heightValue) + '\ncomponentWidth: ' + String(this.componentWidth) + '\ncomponentHeight: ' + String(this.componentHeight), {
            align: Alignment.Bottom,
            offset: { x: 0, y: 60 }
          })
      }
    }.justifyContent(FlexAlign.Center).backgroundColor('#777').width('100%')
  }
}
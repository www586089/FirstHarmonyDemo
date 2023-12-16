import router from '@ohos.router'

@Entry
@Component
struct ShareTransitionSecondPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text('Share Text').opacity(1).fontSize(20).fontColor(Color.Green)
        .sharedTransition('shareText', {
          duration: 2000,
          curve: Curve.Linear,
          type: SharedTransitionEffectType.Static
        })
      Image($r("app.media.girl1")).width(300).opacity(1).borderRadius(25)
        .sharedTransition('girl', {
          duration: 2000,
          curve: Curve.Linear,
          type: SharedTransitionEffectType.Exchange
        })
    }.width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(30)
    .onClick(() => {
        router.back()
    })
  }
}
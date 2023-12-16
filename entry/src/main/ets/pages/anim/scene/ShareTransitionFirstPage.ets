import router from '@ohos.router'

@Entry
@Component
struct ShareTransitionFirstPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Image($r("app.media.girl1")).width(200).opacity(0.2).borderRadius(25)
        .sharedTransition('girl', {
          duration: 2000,
          curve: Curve.Linear,
          type: SharedTransitionEffectType.Exchange
        })
    }
    .width('100%').height('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(30)
    .onClick(() => {
      router.pushUrl({ 'url': 'pages/anim/scene/ShareTransitionSecondPage' })
    })
  }
}
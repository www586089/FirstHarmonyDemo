// SharedTransitionTargetExamplePage.ets
import router from '@ohos.router'

@Entry
@Component
struct SharedTransitionTargetExamplePage {
  build() {
    Stack() {
      Image($r('app.media.girl8')).width('100%').height('100%').objectFit(ImageFit.Contain)
        .sharedTransition('sharedImage', { duration: 800, curve: Curve.Linear, delay: 100 }).onClick(() => {
            router.back()
        })
    }.width('100%').height('100%')
  }
}
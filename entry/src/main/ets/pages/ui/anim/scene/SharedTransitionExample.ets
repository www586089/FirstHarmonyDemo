// SharedTransitionExample.ets
@Entry
@Component
struct SharedTransitionExample {
  @State active: boolean = false

  build() {
    Column() {
      Navigator({ target: 'pages/ui/anim/scene/SharedTransitionTargetExamplePage', type: NavigationType.Push }) {
        Image($r('app.media.girl8')).width(200).height(200).objectFit(ImageFit.Contain)
          .sharedTransition('sharedImage', { duration: 800, curve: Curve.Linear, delay: 100 })
      }.margin({top: 48})
      .onClick(() => {
        this.active = true
      })
    }
  }
}
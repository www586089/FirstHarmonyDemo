import router from '@ohos.router'

@Entry
@Component
struct PageTransitionSrc {
  @State scale2: number = 1
  @State opacity2: number = 1

  build() {
    Column({space: 30}) {
      Text('Src...')
        .fontSize(50).opacity(this.opacity2)
      Image($r('app.media.girl1')).width('100%')
        .scale({x: this.scale2}).opacity(this.opacity2)
    }
    .width('100%')
    .height('90%')
    .onClick(() => {
      router.pushUrl({url: 'pages/anim/scene/PageTransitionDst'})
    })
  }

  pageTransition() {
    PageTransitionEnter({
      duration: 2000, curve: Curve.Linear
    }).onEnter((type, progress) => {
      this.scale2 = progress
      this.opacity2 = progress
    })

    PageTransitionExit({
      duration: 2000
    })
      .onExit((type, progress) => {
        this.scale2 = 1 - progress
        this.opacity2 = 1. - progress
    })
  }
}
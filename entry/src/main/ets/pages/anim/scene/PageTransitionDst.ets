import router from '@ohos.router'

@Entry
@Component
struct PageTransitionDst {
  @State message: string = 'Hello World'
  @State scale2: number = 1
  @State opacity2: number = 1

  build() {
    Column({space: 30}) {
      Text('Dst...')
        .fontSize(50).opacity(this.opacity2)
      Image($r('app.media.girl1')).width('100%')
        .scale({y: this.scale2}).opacity(this.opacity2)
    }
    .width('100%')
    .height('90%')
    .onClick(() => {
      router.back()
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
        this.opacity2 = 1- progress
      })
  }
}
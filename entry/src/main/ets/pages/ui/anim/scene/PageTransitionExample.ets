// index.ets
@Entry
@Component
struct PageTransitionExample {
  @State scale1: number = 1
  @State opacity1: number = 1

  build() {
    Column() {
      Navigator({ target: 'pages/ui/anim/scene/PageTransitionExapleTarget', type: NavigationType.Push }) {
        Image($r('app.media.girl4')).width('100%').height('100%')   // 图片存放在media文件夹下
      }
    }.scale({ x: this.scale1 }).opacity(this.opacity1)
  }

  // 自定义方式2：使用系统提供的多种默认效果(平移、缩放、透明度等)
  pageTransition() {
    PageTransitionEnter({ duration: 1200 })
      .slide(SlideEffect.Left)
    PageTransitionExit({ delay: 100 })
      .translate({ x: 100.0, y: 100.0 })
      .opacity(0)
  }
}
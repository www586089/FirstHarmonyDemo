@Entry
@Component
struct IfElseTransition {
  @State flag: boolean = true;
  @State show: string = 'show';

  build() {
    Column() {
      Button(this.show).width(80).height(30).margin(30)
        .onClick(() => {
          animateTo({ duration: 1000 }, () => {
            // 动画闭包内控制Image组件的出现和消失
            this.flag = !this.flag;
          })
          if (this.flag) {
            this.show = 'hide';
          } else {
            this.show = 'show';
          }
        })
      if (this.flag) {
        // Image的出现和消失配置为不同的过渡效果
        Image($r('app.media.girl13')).width(200).height(200)
          .transition({ type: TransitionType.Insert, translate: { x: 200, y: -200 } })
          .transition({ type: TransitionType.Delete, opacity: 0, scale: { x: 0, y: 0 } })
      }
    }.height('100%').width('100%')
  }
}
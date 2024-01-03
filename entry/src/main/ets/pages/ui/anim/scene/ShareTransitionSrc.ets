// src page
import router from '@ohos.router';

@Entry
@Component
struct SharedTransitionSrc {
  build() {
    Column() {
      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Image($r('app.media.girl10')).width(250).height(250)
        .sharedTransition('sharedImage1', { duration: 1000, curve: Curve.Linear })
        .onClick(() => {
          // 点击小图时路由跳转至下一页面
          router.pushUrl({ url: "pages/ui/anim/scene/ShareTransitionDest" });
        })
    }
    .padding(10)
    .width("100%")
    .alignItems(HorizontalAlign.Start)
  }
}
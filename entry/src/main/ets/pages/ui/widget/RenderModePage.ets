@Entry
@Component
struct RenderModePage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column({ space: 10 }) {
        Row({ space: 50 }) {
          Image($r('app.media.girl9'))// 设置图片的渲染模式为原色
            .renderMode(ImageRenderMode.Original)
            .width(100)
            .height(100)
            .border({ width: 1 })// overlay是通用属性，用于在组件上显示说明文字
            .overlay('Original', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          Image($r('app.media.girl9'))// 设置图片的渲染模式为黑白
            .renderMode(ImageRenderMode.Template)
            .width(100)
            .height(100)
            .border({ width: 1 })
            .overlay('Template', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        }
      }.height(150).width('100%').padding({ top: 20, right: 10 })
    }
  }
}
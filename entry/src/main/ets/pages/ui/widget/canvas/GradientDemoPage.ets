@Entry
@Component
struct GradientDemoPage {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#F5DC62')
        .onReady(() =>{
          this.testGradient()
        })
    }
    .width('100%')
    .height('100%')
  }

  testGradient() {
    //创建一个径向渐变色的CanvasGradient对象
    let grad = this.context.createRadialGradient(200,200,50, 200,200,200)
    //为CanvasGradient对象设置渐变断点值，包括偏移和颜色
    grad.addColorStop(0.0, '#E87361');
    grad.addColorStop(0.5, '#FFFFF0');
    grad.addColorStop(1.0, '#BDDB69');
    //用CanvasGradient对象填充矩形
    this.context.fillStyle = grad;
    this.context.fillRect(0, 0, 400, 400);
  }
}
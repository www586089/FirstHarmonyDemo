@Entry
@Component
struct ClearRect {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#F5DC62')
        .onReady(() =>{
          // 设定填充样式，填充颜色设为蓝色
          this.context.fillStyle = '#0097D4';
          // 以(50, 50)为左上顶点，画一个宽高200的矩形
          this.context.fillRect(50,50,200,200);
          // 以(70, 70)为左上顶点，清除宽150高100的区域
          this.context.clearRect(70,70,150,100);
        })
    }
    .width('100%')
    .height('100%')
  }
}


@Entry
@Component
struct Path2dPage {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Row() {
      Column() {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#F5DC62')
          .onReady(() =>{
            // 使用Path2D的接口构造一个五边形
            let path = new Path2D();
            path.moveTo(150, 50);
            path.lineTo(50, 150);
            path.lineTo(100, 250);
            path.lineTo(200, 250);
            path.lineTo(250, 150);
            path.closePath();
            // 设定填充色为蓝色
            this.context.fillStyle = '#0097D4';
            // 使用填充的方式，将Path2D描述的五边形绘制在canvas组件内部
            this.context.fill(path);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
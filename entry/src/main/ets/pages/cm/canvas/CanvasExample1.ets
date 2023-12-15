@Entry
@Component
struct CanvasExample1 {
  //用来配置CanvasRenderingContext2D对象的参数，包括是否开启抗锯齿，true表明开启抗锯齿。
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  //用来创建CanvasRenderingContext2D对象，通过在canvas中调用CanvasRenderingContext2D对象来绘制。
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      //在canvas中调用CanvasRenderingContext2D对象。
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#F5DC62')
        .onReady(() => {
          //可以在这里绘制内容。
          this.context.strokeRect(50, 50, 200, 150);

          this.context.fillStyle = '#0097D4';
          this.context.fillRect(250, 200, 100, 100);

          this.testDraw()
          this.testDraw2()
          this.basicUse()
          this.basicUse2()
        })
    }
    .width('100%')
    .height('100%')
  }

  testDraw() {
    this.context.beginPath();
    this.context.moveTo(50, 50);
    this.context.lineTo(280, 160);
    this.context.stroke();
  }

  testDraw2() {
    let region = new Path2D();
    region.arc(200, 275, 50, 0, 6.28);
    this.context.stroke(region);
  }

  basicUse() {
    //绘制矩形
    this.context.beginPath();
    this.context.rect(100, 50, 100, 100);
    this.context.stroke();
    //绘制圆形
    this.context.beginPath();
    this.context.arc(150, 250, 50, 0, 6.28);
    this.context.stroke();
    //绘制椭圆
    this.context.beginPath();
    this.context.ellipse(150, 450, 50, 100, Math.PI * 0.25, Math.PI * 0, Math.PI * 2);
    this.context.stroke();

  }

  basicUse2() {
    //绘制填充类文本
    this.context.font = '50px sans-serif';
    this.context.fillText("Hello World!", 50, 100);
    //绘制描边类文本
    this.context.font = '55px sans-serif';
    this.context.strokeText("Hello World!", 50, 150);
  }
}
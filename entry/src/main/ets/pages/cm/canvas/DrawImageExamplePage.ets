@Entry
@Component
struct DrawImageExamplePage {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)
  private img:ImageBitmap = new ImageBitmap("/common/images/1234.png")

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#F5DC62')
        .onReady(() =>{
          // 使用drawImage接口将图片画在（0，0）为起点，宽高130的区域
          this.offContext.drawImage(this.img,0,0,130,130);
          // 使用getImageData接口，获得canvas组件区域中，（50，50）为起点，宽高130范围内的绘制内容
          let imagedata = this.offContext.getImageData(50,50,130,130);
          // 使用putImageData接口将得到的ImageData画在起点为（150， 150）的区域中
          this.offContext.putImageData(imagedata,150,150);
          // 将离屏绘制的内容画到canvas组件上
          let image = this.offContext.transferToImageBitmap();
          this.context.transferFromImageBitmap(image);

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
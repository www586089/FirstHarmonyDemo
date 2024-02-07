@Entry
@Component
struct MiterLimit {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context.lineWidth = 8
          this.context.lineJoin = 'miter'
          this.context.miterLimit = 8
          this.context.moveTo(30, 30)
          this.context.lineTo(130, 135)
          this.context.lineTo(230, 30)
          this.context.stroke()
        })
    }
    .width('100%')
    .height('100%')
  }
}
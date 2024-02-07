@Entry
@Component
struct LineJoinExample {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center }
    ) {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context.beginPath()
          this.context.lineWidth = 8
          this.context.lineJoin = 'bevel'//"bevel" | "miter" | "round"
          this.context.moveTo(30, 30)
          this.context.lineTo(120, 60)
          this.context.lineTo(30, 110)
          this.context.stroke()
        })
    }
    .width('100%')
    .height('100%')
  }
}
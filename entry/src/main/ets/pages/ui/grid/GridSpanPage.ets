@Entry
@Component
struct GridSpanPage {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];


  build() {
    Row() {
      GridRow({ columns: 16 }) {
        ForEach(this.bgColors, (color, index) => {
          GridCol({ span: 4 }) {
            Row() {
              Text(`${index}`)
            }.width('100%').height('50vp')
          }
          .backgroundColor(color)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
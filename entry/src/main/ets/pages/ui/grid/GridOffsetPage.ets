@Entry
@Component
struct GridOffsetPage {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];

  //栅格默认分成12列，每一个子组件默认占1列，偏移2列，每个子组件及间距共占3列，一行放四个子组件。

  build() {
    Row() {
      Column() {
        GridRow({}) {
          ForEach(this.bgColors, (color, index) => {
            GridCol({ offset: 2 }) {
              Row() {
                Text('' + index)
              }.width('100%').height('50vp')
            }
            .backgroundColor(color)
          })
        }
      }
      .width('100%').borderColor("#67c8ff").borderWidth(1)
    }
    .height('100%').alignItems(VerticalAlign.Bottom)
  }
}
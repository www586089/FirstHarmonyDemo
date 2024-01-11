@Entry
@Component
//columns默认值为12，即在未设置columns时，任何断点下，栅格布局被分成12列。
struct GridRow2Page {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink,
  Color.Grey, Color.Blue, Color.Brown,Color.Red, Color.Orange, Color.Yellow, Color.Green];


  build() {
    GridRow({columns: 4, direction: GridRowDirection.Row}) {
      ForEach(this.bgColors, (item, index) => {
        GridCol() {
          Row() {
            Text(`${index + 1}`)
          }.width('100%').height('50')
        }.backgroundColor(item)
      })
    }
  }
}
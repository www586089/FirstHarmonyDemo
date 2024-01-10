@Entry
@Component
struct GridLayoutPage3 {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Grid() {
          GridItem() {
            Text('会议')
          }.backgroundColor('#1067c8ff')
          GridItem() {
            Text('签到')
          }.backgroundColor('#3067c8ff')
          GridItem() {
            Text('培训')
          }.backgroundColor('#5067c8ff')
          GridItem() {
            Text('打印')
          }.backgroundColor('#7067c8ff')
        }.rowsTemplate('1fr 1fr').columnsTemplate('1fr 1fr')
      }
      .width('100%').height('40%')
    }
    .height('100%').alignItems(VerticalAlign.Top)
  }
}
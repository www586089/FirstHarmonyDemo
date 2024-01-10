@Entry
@Component
struct GridLayoutPage3 {
  @State message: Bean[] = [
    { title: '会议', color: '#1067c8ff' },
    { title: '签到', color: '#3067c8ff' },
    { title: '培训', color: '#5067c8ff' },
    { title: '打印', color: '#7067c8ff' }]

  build() {
    Row() {
      Column() {
        Grid() {
          ForEach(this.message, (item: Bean) => {
            GridItem() {
              Text(item.title)
                .backgroundColor(item.color)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          }, item => JSON.stringify(item))
        }.rowsTemplate('1fr 1fr').columnsTemplate('1fr 1fr').rowsGap(10).columnsGap(10).margin(10)
      }
      .width('100%').height('40%').backgroundColor('#eee')
    }
    .height('100%').alignItems(VerticalAlign.Top)
  }
}

class Bean {
  title: string
  color: ResourceColor
}
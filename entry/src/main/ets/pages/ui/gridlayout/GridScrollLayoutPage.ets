
@Entry
@Component
struct GridScrollLayoutPage {
  @State services: Array<string> = ['直播', '进口', '国外', '乡里', '本地', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']
  color: ResourceColor[] = [Color.Blue, Color.Green, Color.Orange, Color.Pink, Color.Yellow]


  build() {
    Column({ space: 5 }) {
      Grid() {
        ForEach(this.services, (service: string, index) => {
          GridItem() {
            Text(service)
              .backgroundColor(this.color[index % this.color.length])
              .fontColor(Color.White)
              .width(72)
              .height(72)
              .fontSize(24)
              .borderRadius(8)
              .textAlign(TextAlign.Center)
              .borderRadius(36)
          }
          .width('25%')
        }, (service: string) => service)
      }
      .rowsTemplate('1fr 1fr') // 只设置rowsTemplate属性，当内容超出Grid区域时，可水平滚动。
      .rowsGap(15)
      .columnsGap(12)
      .height('25%')
    }
    .borderColor(Color.Pink)
    .borderWidth(1)
    .borderRadius(8)
    .margin(8)
    .backgroundColor("#1067c8ff")
  }
}
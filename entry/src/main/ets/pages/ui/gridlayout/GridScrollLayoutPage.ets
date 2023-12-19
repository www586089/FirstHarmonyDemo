@Entry
@Component
struct GridScrollLayoutPage {
  @State services: Array<string> = ['直播', '进口', '国外', '乡里', '本地', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']


  build() {
    Column({ space: 5 }) {
      Grid() {
        ForEach(this.services, (service: string, index) => {
          GridItem() {
            Text(service).backgroundColor("#8067c8ff").width('100%').height('100%').fontSize(40).borderRadius(8).textAlign(TextAlign.Center)
          }
          .width('25%')
        }, service => service)
      }
      .rowsTemplate('1fr 1fr') // 只设置rowsTemplate属性，当内容超出Grid区域时，可水平滚动。
      .rowsGap(15).columnsGap(12).height('20%')
    }.borderColor(Color.Pink).borderWidth(1).padding(8).backgroundColor("#1067c8ff")
  }
}
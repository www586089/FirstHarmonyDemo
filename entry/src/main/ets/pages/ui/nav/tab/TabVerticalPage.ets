@Entry
@Component
struct TabVerticalPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Tabs() {
          TabContent() {
            Text('首页的内容').fontSize(30)
          }
          .tabBar('首页')

          TabContent() {
            Text('推荐的内容').fontSize(30)
          }
          .tabBar('推荐')

          TabContent() {
            Text('发现的内容').fontSize(30)
          }
          .tabBar('发现')

          TabContent() {
            Text('我的内容').fontSize(30)
          }
          .tabBar("我的")
        }
        .vertical(true)
        .barHeight(200)
        .barPosition(BarPosition.Start)
      }
      .width('100%')
    }
    .height('100%')
  }
}
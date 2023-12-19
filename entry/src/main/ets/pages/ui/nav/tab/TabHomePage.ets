@Entry
@Component
struct TabHomePage {

  currentIndex: number = 0

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Row() {
      Column() {
        Tabs({barPosition: BarPosition.End}) {
          TabContent() {
            Text('首页的内容').fontSize(30)
          }
          .tabBar("首页")
          // .tabBar(this.TabBuilder('我的', 0, $r('app.media.mine_selected'), $r('app.media.mine_normal')))

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
        }.vertical(false).barMode(BarMode.Fixed)
      }
      .width('100%')
    }
    .height('100%')
  }
}
@Entry
@Component
struct NestTabPage {

  @Builder
  homeView() {
    Column(){
      Tabs(){
        TabContent() {
          Text('关注的内容').fontSize(30)
        }
        .tabBar('关注')

        TabContent() {
          Text('游戏的内容').fontSize(30)
        }
        .tabBar('游戏')
        TabContent() {
          Text('游戏的内容').fontSize(30)
        }
        .tabBar('视频')
        TabContent() {
          Text('游戏的内容').fontSize(30)
        }
        .tabBar('数码')
        TabContent() {
          Text('科技的内容').fontSize(30)
        }
        .tabBar('科技')
      }
    }
    .backgroundColor('#ff08a8f1')
    .width('100%')
  }

  build() {
    Row() {
      Column() {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent(){
            this.homeView()
          }
          .tabBar('首页')

          // 其他TabContent内容：发现、推荐、我的

          TabContent() {
            Text('推荐的内容').fontSize(30)
          }.backgroundColor('#1008a8f1')
          .tabBar('推荐')

          TabContent() {
            Text('发现的内容').fontSize(30)
          }.backgroundColor('#3008a8f1')
          .tabBar('发现')

          TabContent() {
            Text('我的内容').fontSize(30)
          }.backgroundColor('#5008a8f1')
          .tabBar("我的")
        }
        .scrollable(false)//todo 为true时外层tab不能滑动到内层tab
      }
      .width('100%')
    }
    .height('100%')
  }
}
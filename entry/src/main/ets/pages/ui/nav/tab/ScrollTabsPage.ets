@Entry
@Component
struct ScrollTabsPage {

  tabs: string[] = ['关注', '视频', '游戏', '数码', '科技', '体育', '影视', '人文', '艺术', '自然', '军事']
  build() {
    Row() {
      Column() {
        Tabs() {
          ForEach(this.tabs, (tab: string, index) => {
            TabContent() {
              Text(`${tab}的内容`)
            }.tabBar(tab)
          }, (tab: string) => tab)
        }.barMode(BarMode.Scrollable).barHeight(72).vertical(false)
      }
      .width('100%')
    }
    .height('100%')
  }
}
@Entry
@Component
struct NavHomePage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Navigation() {

      }
      .title('游戏')
      .toolBar(this.navToolBar())
      .menus(this.NavigationMenus())
      .hideTitleBar(false)
      .hideToolBar(false)
      .titleMode(NavigationTitleMode.Full)
    }
    .width('100%').height("100%")
  }

  @Builder
  NavigationMenus() {
    Row() {
      Image($r("app.media.logo_quick_contacts"))
        .width(24)
        .height(24)
      Image($r("app.media.logo_quick_contacts"))
        .width(24)
        .height(24)
        .margin({ left: 24 })
      Image($r("app.media.logo_quick_contacts"))
        .width(24)
        .height(24)
        .margin({ left: 24 })
    }
  }

  @Builder
  navToolBar() {
    Row() {
      Column() {
        Text('A')
      }.backgroundColor("#2067c8ff")

      Column() {
        Text('B')
      }.backgroundColor("#4067c8ff")

      Column() {
        Text('C')
      }.backgroundColor("#6067c8ff")
    }.width('100%').height(48)
  }
}
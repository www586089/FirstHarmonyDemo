@Entry
@Component
struct CustomMenuPage {
  @State select: boolean = true
  private iconStr: ResourceStr = $r("app.media.ic_public_settings")
  private iconStr2: ResourceStr = $r("app.media.ic_public_settings")

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" })
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" }).enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
        endIcon: $r("app.media.ic_public_arrow_right"),
        // 当builder参数进行配置时，表示与menuItem项绑定了子菜单。鼠标hover在该菜单项时，会显示子菜单。
        builder: this.SubMenu.bind(this),
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({ content: "菜单选项" })
          .selectIcon(true)
          .selected(this.select)
          .onChange((selected) => {
            console.info("menuItem select" + selected);
            this.iconStr2 = $r("app.media.icon");
          })
        MenuItem({
          startIcon: this.iconStr2,
          content: "菜单选项",
          endIcon: $r("app.media.ic_public_arrow_right"),
          builder: this.SubMenu.bind(this)
        })
      }

      MenuItem({
        startIcon: this.iconStr2,
        content: "菜单选项",
        endIcon: $r("app.media.ic_public_arrow_right")
      })
    }
  }

  build() {
    Row() {
      Column() {
        Button('click for Menu')
          .bindMenu(this.MyMenu)

        Button('long click for menu')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress)
          .margin({ top: 24 })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Entry
@Component
struct MessageList {
  @State message: string = 'Hello World'

  build() {
    Row() {
      MessageView()
    }
    .height('100%')
  }
}

@Component
struct MessageView {
  @State messages: string[] = [
  // 初始化消息列表数据
    "A", "B", "C", "D"
  ];

  @Builder itemEnd(index: number) {
    // 侧滑后尾端出现的组件
    Button({ type: ButtonType.Circle }) {
      Image($r("app.media.app_icon"))
        .width(20)
        .height(20)
    }
    .onClick(() => {
      this.messages.splice(index, 1);
    })
  }

  build() {
    List() {
      ForEach(this.messages, (item: string, index) => {
        ListItem() {
          Row() {
            Badge({
              count: 1,
              position: BadgePosition.RightTop,
              style: { badgeSize: 16, badgeColor: '#FA2A2D' }
            }) {
              Image($r("app.media.logo_quick_contacts_dialer"))
                .width(40)
                .height(40)
                .margin(10)
            }

            Text(item).fontSize(20)
          }.onClick(() => {
            console.info(`click ---> index = ${index}`)
          })
          .width('100%')
          .justifyContent(FlexAlign.Start)
        }.height(48)
        .swipeAction({ end: this.itemEnd.bind(this, index) }) // 设置侧滑属性
      }, (item: string) => item)
    }.divider(
      {
        strokeWidth: 1, color: Color.Red, startMargin: 12, endMargin: 12
      }
    ).sticky(StickyStyle.Header).width('100%').height('100%')
  }
}
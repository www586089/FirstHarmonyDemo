@Entry
@Component
struct ContactsList {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        ContactsView()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ContactsView {

  @Builder itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  build() {
    List() {
      ListItemGroup({ header: this.itemHead('A') }) {
        // 循环渲染分组A的ListItem
        ListItem() {
          Row() {
            Image($r("app.media.logo_quick_contacts"))
              .width(40)
              .height(40)
              .margin(10)
            Text("小明").fontSize(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
        }

        ListItem() {
          Row() {
            Image($r("app.media.logo_quick_contacts"))
              .width(40)
              .height(40)
              .margin(10)
            Text("小红").fontSize(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
        }

      }

      ListItemGroup({ header: this.itemHead('B') }) {
        // 循环渲染分组B的ListItem
        ListItem() {
          Row() {
            Image($r("app.media.logo_quick_contacts_dialer"))
              .width(40)
              .height(40)
              .margin(10)
            Text("大明").fontSize(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
        }

        ListItem() {
          Row() {
            Image($r("app.media.logo_quick_contacts_dialer"))
              .width(40)
              .height(40)
              .margin(10)
            Text("大红").fontSize(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
        }
      }
    }.width('100%').height('100%')
  }
}
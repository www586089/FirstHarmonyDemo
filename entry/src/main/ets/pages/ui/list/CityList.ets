@Entry
@Component
struct CityList {
  @State message: string = 'Hello World'

  build() {
    Row() {
      CityListView()
    }.height('100%').width('100%')
  }
}

@Component
struct CityListView {
  build() {
    List({space: 10}) {
      ListItem() {
        Text('北京').fontSize(24)
      }

      ListItem() {
        Text('杭州').fontSize(24)
      }

      ListItem() {
        Text('上海').fontSize(24)
      }
    }
    .backgroundColor('#FFF1F3F5')
    .alignListItem(ListItemAlign.Center)
    .divider({
      strokeWidth: 0.5,
      startMargin: 12, endMargin: 12,
      color: '#67c8ff'
    })
    .height('100%').width('100%')
  }
}
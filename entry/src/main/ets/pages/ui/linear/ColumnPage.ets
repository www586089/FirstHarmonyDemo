
@Entry
@Component
struct ColumnPage {

  build() {
    Column({ space: 20 }) {
      Text('space: 20').fontSize(15).fontColor(Color.Gray).width('90%')
      Row().width('90%').height(50).backgroundColor(0xF5DEB3)
      Row().width('90%').height(50).backgroundColor(0xD2B48C)
      Row().width('90%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%')
  }
}

@Entry
@Component
struct RowPage {

  build() {
    Row({ space: 35 }) {
      Text('space: 35').fontSize(15).fontColor(Color.Gray)
      Row().width('10%').height(150).backgroundColor(0xF5DEB3)
      Row().width('10%').height(150).backgroundColor(0xD2B48C)
      Row().width('10%').height(150).backgroundColor(0xF5DEB3)
    }.width('100%')
  }
}
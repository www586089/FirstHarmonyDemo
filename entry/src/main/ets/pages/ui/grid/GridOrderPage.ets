@Entry
@Component
struct GridOrderPage {

  build() {
    Row() {
      Column() {
        GridRow() {
          GridCol({ order: 4 }) {
            Row() {
              Text('1')
            }.width('100%').height('50vp')
          }.backgroundColor(Color.Red)
          GridCol({ order: 3 }) {
            Row() {
              Text('2')
            }.width('100%').height('50vp')
          }.backgroundColor(Color.Orange)
          GridCol({ order: 2 }) {
            Row() {
              Text('3')
            }.width('100%').height('50vp')
          }.backgroundColor(Color.Yellow)
          GridCol({ order: 1 }) {
            Row() {
              Text('4')
            }.width('100%').height('50vp')
          }.backgroundColor(Color.Green)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
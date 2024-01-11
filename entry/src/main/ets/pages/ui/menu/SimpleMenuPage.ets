@Entry
@Component
struct SimpleMenuPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button('click for Menu')
          .bindMenu([
            {
              value: 'Menu1',
              action: () => {
                console.info('handle Menu1 select')
              }
            }
          ])
      }
      .width('100%')
    }
    .height('100%').alignItems(VerticalAlign.Bottom)
  }
}
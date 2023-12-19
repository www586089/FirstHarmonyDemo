
@Entry
@Component
struct VerifySmsPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold).onClick(() => {

        })
      }
      .width('100%').height('100%').backgroundColor('#67c8ff').borderRadius(24)
    }.padding(12)
    .height('100%')
  }
}
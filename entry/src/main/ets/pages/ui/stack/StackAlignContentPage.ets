@Entry
@Component
struct StackAlignContentPage {
  @State message: string = 'Hello World'

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
      }.width(200).height(200).backgroundColor(0x86C5E3)

      Column() {
      }.width(150).height(150).backgroundColor(0x92D6CC)

      Column() {
      }.width(100).height(100).backgroundColor(0xF5DC62)
    }.margin({ top: 100 })
    .width(350)
    .height(350)
    .backgroundColor(0xe0e0e0)
  }
}
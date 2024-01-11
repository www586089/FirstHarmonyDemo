@Entry
@Component
struct TextPopupExamplePage {
  @State handlePopup: boolean = false

  build() {
    Column() {
      Button('PopupOptions')
        .onClick(() => {
          this.handlePopup = !this.handlePopup
        })
        .bindPopup(this.handlePopup, {
          message: 'This is a popup with PopupOptions',
        })
    }.width('100%')
    .height('100%')
    .padding({ top: 5 })
    .justifyContent(FlexAlign.Center)
  }
}
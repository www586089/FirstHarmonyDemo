import webview from '@ohos.web.webview'

@Entry
@Component
struct NetworkCompPage {
  @State message: string = 'Hello World'

  private controller: WebviewController = new webview.WebviewController()
  private url: string = 'https://www.baidu.com/?tn=15007414_12_dg'


  build() {
    Row() {
      Column() {
        Web({
          src: this.url,
          controller: this.controller
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
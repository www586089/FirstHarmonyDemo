import http from '@ohos.net.http'

@Entry
@Component
struct HttpTestDemoPage {

  private url: string = 'https://api.apiopen.top/api/sentences'
  @State poem: string = ''
  @State from: string = ''

  aboutToAppear() {
    setInterval(() => {
      let httpReq = http.createHttp()
      httpReq.request(this.url, {
        method: http.RequestMethod.GET
      }, (err, data) => {
        if (!err) {
          this.poem = JSON.parse(`${data.result}`).result.name
          this.from = JSON.parse(`${data.result}`).result.from
        }
      })
    }, 2000)
  }

  build() {
    Row() {
      Column() {
        Text(this.poem).fontSize(24)
        Text(this.from).fontSize(24)
      }
      .width('100%').backgroundColor('#8067c8ff').padding({
        top: 24,
        bottom: 24,
        left: 12,
        right: 12
      }).borderRadius(12).borderColor(Color.Red).borderWidth(1.5)
    }.width('100%').padding(12)
    .height('100%')
  }
}
import router from '@ohos.router'

@Entry
@Component
struct RouterStandardPage {
  @State message: string = '演示标准路由跳转'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('查看详情').padding({left: 12, right: 12, top: 8, bottom: 8}).onClick(() => {
          router.pushUrl({url: "pages/router/GoodsDetailPage"}, router.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info('Invoke pushUrl succeeded.');
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

import router from '@ohos.router'
@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'



  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }


  build() {
    Row() {
      Column() {
        Button() {
          Text("Next2").fancy(FontWeight.Bold, 30)
        }.cuteButton().type(ButtonType.Capsule).onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          router.pushUrl({ url: 'pages/linear/ColumnPage'}).then(() => {
            console.info('Succeeded in jumping to the second page.')
          }).catch((err) => {
            console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })
        Button() {
          Text("RowPage").fancy(FontWeight.Bold, 30)
        }.cuteButton().onClick(() => {
          router.pushUrl({url: 'pages/linear/RowPage'})
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
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
        FancyButton({info: 'ColumPage', action: (() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          router.pushUrl({ url: 'pages/linear/ColumnPage'}).then(() => {
            console.info('Succeeded in jumping to the second page.')
          }).catch((err) => {
            console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })})
        FancyButton({info: 'RowPage', action: (() => {
          router.pushUrl({url: 'pages/linear/RowPage'})
        })})

        FancyButton({info: 'ColumnAlign', action: (() => {
          router.pushUrl({url: 'pages/linear/ColumnAlignPage'})
        })})

      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct FancyButton {
  @BuilderParam
  info: string = "";
  @BuilderParam
  action: (event?: ClickEvent) => void;

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  build() {

    Button() {
      Text(this.info).fancy(FontWeight.Bold, 30)
    }.cuteButton().type(ButtonType.Capsule).onClick(() => {
      {
        this.action.call(this)
      }
    })
  }
}
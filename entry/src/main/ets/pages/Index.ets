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

        FancyButton({info: 'RowAlign', action: (() => {
          router.pushUrl({url: 'pages/linear/RowAlignPage'})
        })})
        FancyButton({info: 'ColumnVPage', action: (() => {
          router.pushUrl({url: 'pages/linear/ColumnVPage'})
        })})
        FancyButton({info: 'RowVPage', action: (() => {
          router.pushUrl({url: 'pages/linear/RowVPage'})
        })})
        FancyButton({info: 'BlankExample', action: (() => {
          router.pushUrl({url: 'pages/linear/BlankExample'})
        })})
        FancyButton({info: 'LayoutWeightPage', action: (() => {
          router.pushUrl({url: 'pages/linear/LayoutWeightPage'})
        })})
        FancyButton({info: 'WidthExample', action: (() => {
          router.pushUrl({url: 'pages/linear/WidthExample'})
        })})
        FancyButton({info: 'ScrollVerticalExample', action: (() => {
          router.pushUrl({url: 'pages/linear/ScrollVerticalExample'})
        })})
        FancyButton({info: 'ScrollHorizontalExample', action: (() => {
          router.pushUrl({url: 'pages/linear/ScrollHorizontalExample'})
        })})

        //Stack begin
        FancyButton({info: 'StackLayout', action: (() => {
          router.pushUrl({url: 'pages/stack/StackLayout'})
        })})
        FancyButton({info: 'StackZIndex', action: (() => {
          router.pushUrl({url: 'pages/stack/StackZIndex'})
        })})
        FancyButton({info: 'StackExample', action: (() => {
          router.pushUrl({url: 'pages/stack/StackExample'})
        })})
        //--->end

        //Flex begin
        FancyButton({info: 'FlexLayout', action: (() => {
          router.pushUrl({url: 'pages/flex/FlexLayout'})
        })})
        FancyButton({info: 'FlexWrapPage', action: (() => {
          router.pushUrl({url: 'pages/flex/FlexWrapPage'})
        })})
        FancyButton({info: 'FlexChildAlign', action: (() => {
          router.pushUrl({url: 'pages/flex/FlexChildAlign'})
        })})
        FancyButton({info: 'FlexAlignItems', action: (() => {
          router.pushUrl({url: 'pages/flex/FlexAlignItems'})
        })})
        FancyButton({info: 'FlexAlignContent', action: (() => {
          router.pushUrl({url: 'pages/flex/FlexAlignContent'})
        })})
        FancyButton({info: 'FlexAlignChildSelf', action: (() => {
          router.pushUrl({url: 'pages/flex/FlexAlignChildSelf'})
        })})
        FancyButton({info: 'FlexStrech', action: (() => {
          router.pushUrl({url: 'pages/flex/FlexStrech'})
        })})
        FancyButton({info: 'FlexExample', action: (() => {
          router.pushUrl({url: 'pages/flex/FlexExample'})
        })})
        //---->end
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
    .width('45%')
    .height('5%')
  }

  build() {

    Button() {
      Text(this.info).fancy(FontWeight.Normal, 20)
    }.cuteButton().type(ButtonType.Capsule).onClick(() => {
      {
        this.action.call(this)
      }
    })
  }
}
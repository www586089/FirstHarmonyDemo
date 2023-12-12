import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct LLDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: "ColumnPage", action: ((event?: ClickEvent) => {
      console.info(`Succeeded in clicking the 'Next' button.`)
      router.pushUrl({ url: 'pages/linear/ColumnPage' }).then(() => {
        console.info('Succeeded in jumping to the second page.')
      }).catch((err) => {
        console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
      })
    }) },
    { info: "RowPage", action: ((event?: ClickEvent) => {
      router.pushUrl({ url: 'pages/linear/RowPage' })
    }) },
    { info: "ColumnAlign", action: ((event?: ClickEvent) => {
      router.pushUrl({ url: 'pages/linear/ColumnAlignPage' })
    }) },
    { info: 'RowAlign', action: (() => {
      router.pushUrl({ url: 'pages/linear/RowAlignPage' })
    }) },
    { info: 'ColumnVPage', action: (() => {
      router.pushUrl({ url: 'pages/linear/ColumnVPage' })
    }) },
    { info: 'RowVPage', action: (() => {
      router.pushUrl({ url: 'pages/linear/RowVPage' })
    }) },
    { info: 'BlankExample', action: (() => {
      router.pushUrl({ url: 'pages/linear/BlankExample' })
    }) },
    { info: 'LayoutWeightPage', action: (() => {
      router.pushUrl({ url: 'pages/linear/LayoutWeightPage' })
    }) },
    { info: 'WidthExample', action: (() => {
      router.pushUrl({ url: 'pages/linear/WidthExample' })
    }) },
    { info: 'ScrollVerticalExample', action: (() => {
      router.pushUrl({ url: 'pages/linear/ScrollVerticalExample' })
    }) },
    { info: 'ScrollHorizontalExample', action: (() => {
      router.pushUrl({ url: 'pages/linear/ScrollHorizontalExample' })
    }) },
  ]


  build() {
    List() {
      ForEach(this.itemList, (item) => {
        ListItem() {
          FancyButton({ info: item.info, action: (() => {
            item.action.call()
          }) })
        }
      }, item => item.info)
    }.alignListItem(ListItemAlign.Center)
    .height('100%').width('100%')
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
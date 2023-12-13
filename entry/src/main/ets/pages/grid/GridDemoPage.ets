import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct GridDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: 'GridRow1Page', action: (() => {
      router.pushUrl({ url: 'pages/grid/GridRow1Page' })
    }) },
    { info: 'GridRow2Page', action: (() => {
      router.pushUrl({ url: 'pages/grid/GridRow2Page' })
    }) },
    { info: 'GridRow3Page', action: (() => {
      router.pushUrl({ url: 'pages/grid/GridRow3Page' })
    }) },
    { info: 'GridSpanPage', action: (() => {
      router.pushUrl({ url: 'pages/grid/GridSpanPage' })
    }) },
    { info: 'GridOffsetPage', action: (() => {
      router.pushUrl({ url: 'pages/grid/GridOffsetPage' })
    }) },
    { info: 'GridOrderPage', action: (() => {
      router.pushUrl({ url: 'pages/grid/GridOrderPage' })
    }) },
    { info: 'GridRowExample', action: (() => {
      router.pushUrl({ url: 'pages/grid/GridRowExample' })
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
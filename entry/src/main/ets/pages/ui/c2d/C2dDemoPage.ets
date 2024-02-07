import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct C2dDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: 'FillStyleExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/c2d/FillStyleExample' })
    }) },
    { info: 'GridRow2Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/c2d/GridRow2Page' })
    }) },
    { info: 'GridRow3Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/c2d/GridRow3Page' })
    }) },
    { info: 'GridSpanPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/c2d/GridSpanPage' })
    }) },
    { info: 'GridOffsetPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/c2d/GridOffsetPage' })
    }) },
    { info: 'GridOrderPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/c2d/GridOrderPage' })
    }) },
    { info: 'GridRowExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/c2d/GridRowExample' })
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
  info: string = "";
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
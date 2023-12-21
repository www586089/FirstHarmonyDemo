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

  itemList: object[] = [
    {
      info: "UI组件的使用", action: (() => {
      router.pushUrl({ url: 'pages/ui/UIDemoPage' })
    }) },
    {
      info: "状态管理", action: (() => {
      router.pushUrl({ url: 'pages/state/StateManagerDemoPage' })
    }) },
    { info: '窗口管理', action: (() => {
      router.pushUrl({ url: 'pages/window/WindowDemoPage' })
    }) },
    {
      info: "DemoPage", action: (() => {
      router.pushUrl({ url: 'pages/demo/DemoPage' })
    }) },
    { info: 'MediaQueryDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/config/MediaQueryDemoPage' })
    }) },
    { info: 'RouterDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/router/RouterDemoPage' })
    }) },
    { info: 'NetworkDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/net/NetworkDemoPage' })
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
    }.alignListItem(ListItemAlign.Center).margin({top: 48})
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
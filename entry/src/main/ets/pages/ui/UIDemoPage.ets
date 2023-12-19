import router from '@ohos.router'

@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}


@Entry
@Component
struct UIDemoPage {
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
      info: "LLDemoPage", action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/LLDemoPage' })
    }) },
    { info: 'StackDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/stack/StackDemoPage' })
    }) },
    { info: 'FlexDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexDemoPage' })
    }) },
    { info: 'ListDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/list/ListDemoPage' })
    }) },
    { info: 'RelativeLayoutDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/relative/RelativeLayoutDemoPage' })
    }) },
    { info: 'GridDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/grid/GridDemoPage' })
    }) },
    { info: 'SwiperDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/swiper/SwiperDemoPage' })
    }) },
    { info: 'NavigationDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/nav/NavigationDemoPage' })
    }) },
    { info: 'TabDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/nav/tab/TabDemoPage' })
    }) },
    { info: 'ImageDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageDemoPage' })
    }) },
    { info: 'ShapeDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/shape/ShapeDemoPage' })
    }) },
    { info: 'CanvasDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/canvas/CanvasDemoPage' })
    }) },
    { info: 'PropertyAnimDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/PropertyAnimDemoPage' })
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
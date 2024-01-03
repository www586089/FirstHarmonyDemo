import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct LayoutAnimDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: 'LayoutUpdateAnimPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/layout/LayoutUpdateAnimPage' })
    }) },
    { info: 'LayoutUpdateAnim2Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/layout/LayoutUpdateAnim2Page' })
    }) },
    { info: 'LayoutUpdateAnim3Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/layout/LayoutUpdateAnim3Page' })
    }) },
    { info: 'ShareTransitionFirstPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/scene/ShareTransitionFirstPage' })
    }) },
    { info: 'ViewAnimation1Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/view/ViewAnimation1Page' })
    }) },
    { info: 'AttrAnimationExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/property/AttrAnimationExample' })
    }) },
    { info: 'PageTransitionExample1', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/scene/PageTransitionExample1' })
    }) },
    { info: 'PageTransitionExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/scene/PageTransitionExample' })
    }) },
    { info: 'WidgetTransitionExamplePage', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/scene/WidgetTransitionExamplePage' })
    }) },
    { info: 'SharedTransitionExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/scene/SharedTransitionExample' })
    }) },
    { info: 'MotionPathExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/anim/scene/MotionPathExample' })
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
import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct PropertyAnimDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: 'PropertyAnim1Page', action: (() => {
      router.pushUrl({ url: 'pages/anim/PropertyAnim1Page' })
    }) },
    { info: 'TransitionScenePage', action: (() => {
      router.pushUrl({ url: 'pages/anim/scene/TransitionScenePage' })
    }) },
    { info: 'TransitionScene2Page', action: (() => {
      router.pushUrl({ url: 'pages/anim/scene/TransitionScene2Page' })
    }) },
    { info: 'ShareTransitionFirstPage', action: (() => {
      router.pushUrl({ url: 'pages/anim/scene/ShareTransitionFirstPage' })
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
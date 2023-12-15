import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct CanvasDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: 'CanvasExample1', action: (() => {
      router.pushUrl({ url: 'pages/cm/canvas/CanvasExample1' })
    }) },
    { info: 'CanvasExample2', action: (() => {
      router.pushUrl({ url: 'pages/cm/canvas/CanvasExample2' })
    }) },
    { info: 'DrawImageExamplePage', action: (() => {
      router.pushUrl({ url: 'pages/cm/canvas/DrawImageExamplePage' })
    }) },
    { info: 'GradientDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/cm/canvas/GradientDemoPage' })
    }) },
    { info: 'ClearRect', action: (() => {
      router.pushUrl({ url: 'pages/cm/canvas/ClearRect' })
    }) },
    { info: 'Path2dPage', action: (() => {
      router.pushUrl({ url: 'pages/cm/canvas/Path2dPage' })
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
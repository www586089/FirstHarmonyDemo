import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct FlexDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
  //Flex begin
    { info: 'FlexLayout', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexLayout' })
    }) },
    { info: 'FlexWrapPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexWrapPage' })
    }) },
    { info: 'FlexChildAlign', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexChildAlign' })
    }) },
    { info: 'FlexAlignItems', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexAlignItems' })
    }) },
    { info: 'FlexAlignContent', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexAlignContent' })
    }) },
    { info: 'FlexAlignChildSelf', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexAlignChildSelf' })
    }) },
    { info: 'FlexStrech', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexStrech' })
    }) },
    { info: 'FlexExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/flex/FlexExample' })
    }) },
  //---->end
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
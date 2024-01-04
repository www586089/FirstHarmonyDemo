import router from '@ohos.router';


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct ImageDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: 'ImageSelectPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageSelectPage' })
    }) },
    { info: 'ImageFitPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageFitPage' })
    }) },
    { info: 'ImageBase64TestPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageBase64TestPage' })
    }) },
    { info: 'ShowNetworkImagePage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ShowNetworkImagePage' })
    }) },
    { info: 'SVGImageTestPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/SVGImageTestPage' })
    }) },
    { info: 'ImageInterpolationPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageInterpolationPage' })
    }) },
    { info: 'ImageRepeatTestPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageRepeatTestPage' })
    }) },
    { info: 'ImageSourceSizePage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageSourceSizePage' })
    }) },
    { info: 'ImageLoadEventPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageLoadEventPage' })
    }) },
    { info: 'ImageInterpolationPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageInterpolationPage' })
    }) },
    { info: 'RenderModePage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/RenderModePage' })
    }) },
    { info: 'ImageColorFilterPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/widget/ImageColorFilterPage' })
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
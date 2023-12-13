import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct SwiperDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: 'SwiperPage1', action: (() => {
      router.pushUrl({ url: 'pages/swiper/SwiperPage1' })
    }) },
    { info: 'SwipeIndicatorPage', action: (() => {
      router.pushUrl({ url: 'pages/swiper/SwipeIndicatorPage' })
    }) },
    { info: 'SwipeControlPage', action: (() => {
      router.pushUrl({ url: 'pages/swiper/SwipeControlPage' })
    }) },
    { info: 'GridScrollLayoutPage', action: (() => {
      router.pushUrl({ url: 'pages/gridlayout/GridScrollLayoutPage' })
    }) },
    { info: 'ToDoListPage', action: (() => {
      router.pushUrl({ url: 'pages/list/ToDoListPage' })
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
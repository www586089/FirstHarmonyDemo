import router from '@ohos.router'
import { FunctionCallType } from '../../../utils/Type'


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

  itemList: FunctionCallType[] = [
    { info: 'SwiperPage1', action: (() => {
      router.pushUrl({ url: 'pages/ui/swiper/SwiperPage1' })
    }) },
    { info: 'SwipeIndicatorPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/swiper/SwipeIndicatorPage' })
    }) },
    { info: 'SwipeControlPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/swiper/SwipeControlPage' })
    }) },
    { info: 'VerticalScrollPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/swiper/demo/VerticalScrollPage' })
    }) },
    { info: 'ToDoListPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/list/ToDoListPage' })
    }) },
  ]


  build() {
    List() {
      ForEach(this.itemList, (item: FunctionCallType) => {
        ListItem() {
          FancyButton({ info: item.info, action: (() => {
            item.action()
          }) })
        }
      }, (item: FunctionCallType) => item.info)
    }.alignListItem(ListItemAlign.Center)
    .height('100%').width('100%')
  }
}

@Component
struct FancyButton {
  info: string = "";
  action?: () => void;

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
        this.action?.()
      }
    })
  }
}
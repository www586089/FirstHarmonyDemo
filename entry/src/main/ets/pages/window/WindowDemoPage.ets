import router from '@ohos.router'
import { FunctionCallType } from '../../utils/Type'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct WindowDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: FunctionCallType[] = [
    { info: 'BasicWindowDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/window/BasicWindowDemoPage' })
    }) },
    { info: 'PropDemo2Page', action: (() => {
      router.pushUrl({ url: 'pages/state/prop/PropDemo2Page' })
    }) },
    { info: 'PropDemo3Page', action: (() => {
      router.pushUrl({ url: 'pages/state/prop/PropDemo3Page' })
    }) },
    { info: 'LinkDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/state/link/LinkDemoPage' })
    }) },
    { info: 'LinkDemo1Page', action: (() => {
      router.pushUrl({ url: 'pages/state/link/LinkDemo1Page' })
    }) },
    { info: 'LinkDemo2Page', action: (() => {
      router.pushUrl({ url: 'pages/state/link/LinkDemo2Page' })
    }) },
    { info: 'ProvideConsumeDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/state/multi/ProvideConsumeDemoPage' })
    }) },
    { info: 'ProvideConsumeDemo2Page', action: (() => {
      router.pushUrl({ url: 'pages/state/multi/ProvideConsumeDemo2Page' })
    }) },
    { info: 'WatchDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/state/WatchDemoPage' })
    }) },
    { info: 'StateDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/state/StateDemoPage' })
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
  action?: (event?: ClickEvent) => void;

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
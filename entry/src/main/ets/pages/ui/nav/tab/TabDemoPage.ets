import router from '@ohos.router'
import { FunctionCallType } from '../../../../utils/Type'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct TabDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: FunctionCallType[] = [
    { info: 'TabHomePage', action: (() => {
      router.pushUrl({ url: 'pages/ui/nav/tab/TabHomePage' })
    }) },
    { info: 'TabVerticalPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/nav/tab/TabVerticalPage' })
    }) },
    { info: 'NestTabPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/nav/tab/NestTabPage' })
    }) },
    { info: 'ScrollTabsPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/nav/tab/ScrollTabsPage' })
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
import router from '@ohos.router'
import { FunctionCallType } from '../../../utils/Type'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct GridLayoutDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: FunctionCallType[] = [
    { info: 'GridLayoutPage1', action: (() => {
      router.pushUrl({ url: 'pages/ui/gridlayout/GridLayoutPage1' })
    }) },
    { info: 'CalculatorLayoutPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/gridlayout/CalculatorLayoutPage' })
    }) },
    { info: 'GridLayoutPage2', action: (() => {
      router.pushUrl({ url: 'pages/ui/gridlayout/GridLayoutPage2' })
    }) },
    { info: 'GridScrollLayoutPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/gridlayout/GridScrollLayoutPage' })
    }) },
    { info: 'GridLayoutPage3', action: (() => {
      router.pushUrl({ url: 'pages/ui/gridlayout/GridLayoutPage3' })
    }) },
    { info: 'CalendarLayoutPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/gridlayout/CalendarLayoutPage' })
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
  @BuilderParam
  info: string;
  @BuilderParam
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
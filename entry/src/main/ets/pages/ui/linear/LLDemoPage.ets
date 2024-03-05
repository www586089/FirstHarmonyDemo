import router from '@ohos.router';
import { FunctionCallType } from '../../../utils/Type';
import base from '@ohos.base';


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct LLDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: FunctionCallType[] = [
    { info: "ColumnPage", action: ((event?: ClickEvent) => {
      console.info(`Succeeded in clicking the 'Next' button.`)
      router.pushUrl({ url: 'pages/ui/linear/ColumnPage' }).then(() => {
        console.info('Succeeded in jumping to the second page.')
      }).catch((err: base.BusinessError) => {
        console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
      })
    }) },
    { info: "RowPage", action: ((event?: ClickEvent) => {
      router.pushUrl({ url: 'pages/ui/linear/RowPage' })
    }) },
    { info: "ColumnAlign", action: ((event?: ClickEvent) => {
      router.pushUrl({ url: 'pages/ui/linear/ColumnAlignPage' })
    }) },
    { info: 'RowAlign', action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/RowAlignPage' })
    }) },
    { info: 'ColumnVPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/ColumnVPage' })
    }) },
    { info: 'RowVPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/RowVPage' })
    }) },
    { info: 'BlankExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/BlankExample' })
    }) },
    { info: 'LayoutWeightPage', action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/LayoutWeightPage' })
    }) },
    { info: 'WidthExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/WidthExample' })
    }) },
    { info: 'ScrollVerticalExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/ScrollVerticalExample' })
    }) },
    { info: 'ScrollHorizontalExample', action: (() => {
      router.pushUrl({ url: 'pages/ui/linear/ScrollHorizontalExample' })
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
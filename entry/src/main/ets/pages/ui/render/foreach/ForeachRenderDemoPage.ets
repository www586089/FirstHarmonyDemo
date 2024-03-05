import router from '@ohos.router'
import { FunctionCallType } from '../../../../utils/Type'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

/**
 * 条件渲染
 */
@Entry
@Component
struct ForeachRenderDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: FunctionCallType[] = [
    { info: 'ForeachRenderDemo1Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/foreach/ForeachRenderDemo1Page' })
    }) },
    { info: 'ForeachRenderDemo2Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/foreach/ForeachRenderDemo2Page' })
    }) },
    { info: 'ForeachRenderDemo3Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/foreach/ForeachRenderDemo3Page' })
    }) },
    { info: 'ForeachRenderDemo4Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/foreach/ForeachRenderDemo4Page' })
    }) },
    { info: 'ForeachRenderDemo5Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/foreach/ForeachRenderDemo5Page' })
    }) },
    { info: 'ForeachRenderDemo6Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/foreach/ForeachRenderDemo6Page' })
    }) },
    { info: 'ForeachRenderDemo7Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/foreach/ForeachRenderDemo7Page' })
    }) },
    { info: 'ForeachRenderDemo8Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/foreach/ForeachRenderDemo8Page' })
    }) },
    { info: 'RenderTestDemo4Page', action: (() => {
      router.pushUrl({ url: 'pages/ui/render/RenderTestDemo4Page' })
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
import router from '@ohos.router'


@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct StateManagerDemoPage {

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: 'PropDemoPage', action: (() => {
      router.pushUrl({ url: 'pages/state/prop/PropDemoPage' })
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
    { info: '嵌套对象变化', action: (() => {
      router.pushUrl({ url: 'pages/state/complex/NestObjectDemoPage' })
    }) },
    { info: '对象数组变化', action: (() => {
      router.pushUrl({ url: 'pages/state/complex/ObjectArrayDemoPage' })
    }) },
    { info: '二维数组变化', action: (() => {
      router.pushUrl({ url: 'pages/state/complex/NestObjectDemo2Page' })
    }) },
    { info: 'LocalStorageDemo1Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/local/LocalStorageDemo1Page' })
    }) },
    { info: 'LocalStorageDemo2Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/local/LocalStorageDemo2Page' })
    }) },
    { info: 'LocalStorageDemo3Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/local/LocalStorageDemo3Page' })
    }) },
    { info: 'LocalStorageDemo4Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/local/LocalStorageDemo4Page' })
    }) },

    { info: 'AppStorageDemo1Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/app/AppStorageDemo1Page' })
    }) },
    { info: 'AppStorageDemo2Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/app/AppStorageDemo2Page' })
    }) },
    { info: 'AppStorageDemo3Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/app/AppStorageDemo3Page' })
    }) },
    { info: 'AppStorageDemo4Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/app/AppStorageDemo4Page' })
    }) },
    { info: 'PersistStorageDemo2Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/persist/PersistStorageDemo2Page' })
    }) },
    { info: 'OtherStateChangeDemo1Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/other/OtherStateChangeDemo1Page' })
    }) },
    { info: 'OtherStateChangeDemo2Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/other/OtherStateChangeDemo2Page' })
    }) },
    { info: 'RefreshDemo1Page', action: (() => {
      router.pushUrl({ url: 'pages/state/storage/other/RefreshDemo1Page' })
    }) },
  ]


  build() {
    List() {
      ForEach(this.itemList, (item, index) => {
        ListItem() {
          FancyButton({ info: item.info, action: (() => {
            item.action.call()
          }) }).margin({top: 0 == index ? 48 : 0})
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
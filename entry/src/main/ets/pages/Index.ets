import router from '@ohos.router'

@Extend(Text) function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  @Styles cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }

  itemList: object[] = [
    { info: "ColumnPage", action: ((event?: ClickEvent) => {
      console.info(`Succeeded in clicking the 'Next' button.`)
      router.pushUrl({ url: 'pages/linear/ColumnPage' }).then(() => {
        console.info('Succeeded in jumping to the second page.')
      }).catch((err) => {
        console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
      })
    }) },
    { info: "RowPage", action: ((event?: ClickEvent) => {
      router.pushUrl({ url: 'pages/linear/RowPage' })
    }) },
    { info: "ColumnAlign", action: ((event?: ClickEvent) => {
      router.pushUrl({ url: 'pages/linear/ColumnAlignPage' })
    }) },
    { info: 'RowAlign', action: (() => {
      router.pushUrl({ url: 'pages/linear/RowAlignPage' })
    }) },
    { info: 'ColumnVPage', action: (() => {
      router.pushUrl({ url: 'pages/linear/ColumnVPage' })
    }) },
    { info: 'RowVPage', action: (() => {
      router.pushUrl({ url: 'pages/linear/RowVPage' })
    }) },
    { info: 'BlankExample', action: (() => {
      router.pushUrl({ url: 'pages/linear/BlankExample' })
    }) },
    { info: 'LayoutWeightPage', action: (() => {
      router.pushUrl({ url: 'pages/linear/LayoutWeightPage' })
    }) },
    { info: 'WidthExample', action: (() => {
      router.pushUrl({ url: 'pages/linear/WidthExample' })
    }) },
    { info: 'ScrollVerticalExample', action: (() => {
      router.pushUrl({ url: 'pages/linear/ScrollVerticalExample' })
    }) },
    { info: 'ScrollHorizontalExample', action: (() => {
      router.pushUrl({ url: 'pages/linear/ScrollHorizontalExample' })
    }) },

    //Stack begin
    { info: 'StackLayout', action: (() => {
      router.pushUrl({ url: 'pages/stack/StackLayout' })
    }) },
    { info: 'StackZIndex', action: (() => {
      router.pushUrl({ url: 'pages/stack/StackZIndex' })
    }) },
    { info: 'StackExample', action: (() => {
      router.pushUrl({ url: 'pages/stack/StackExample' })
    }) },
    //--->end

    //Flex begin
    { info: 'FlexLayout', action: (() => {
      router.pushUrl({ url: 'pages/flex/FlexLayout' })
    }) },
    { info: 'FlexWrapPage', action: (() => {
      router.pushUrl({ url: 'pages/flex/FlexWrapPage' })
    }) },
    { info: 'FlexChildAlign', action: (() => {
      router.pushUrl({ url: 'pages/flex/FlexChildAlign' })
    }) },
    { info: 'FlexAlignItems', action: (() => {
      router.pushUrl({ url: 'pages/flex/FlexAlignItems' })
    }) },
    { info: 'FlexAlignContent', action: (() => {
      router.pushUrl({ url: 'pages/flex/FlexAlignContent' })
    }) },
    { info: 'FlexAlignChildSelf', action: (() => {
      router.pushUrl({ url: 'pages/flex/FlexAlignChildSelf' })
    }) },
    { info: 'FlexStrech', action: (() => {
      router.pushUrl({ url: 'pages/flex/FlexStrech' })
    }) },
    { info: 'FlexExample', action: (() => {
      router.pushUrl({ url: 'pages/flex/FlexExample' })
    }) },
    //---->end


    //Flex begin
    { info: 'CityList', action: (() => {
      router.pushUrl({ url: 'pages/list/CityList' })
    }) },
    { info: 'ContactsList', action: (() => {
      router.pushUrl({ url: 'pages/list/ContactsList' })
    }) },
    { info: 'ContactsListMore', action: (() => {
      router.pushUrl({ url: 'pages/list/ContactsListMore' })
    }) },
    { info: 'MessageList', action: (() => {
      router.pushUrl({ url: 'pages/list/MessageList' })
    }) },
    { info: 'ToDoListPage', action: (() => {
      router.pushUrl({ url: 'pages/list/ToDoListPage' })
    }) },
  //---->
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
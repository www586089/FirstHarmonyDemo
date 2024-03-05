@Entry
@Component
struct HealthyHomePage {
  @State message: string = 'Hello World'

  @State curIndex: number = 0
  @State foodCurIndex: number = 0


  private foodTabArray: Array<string> = [
    '蔬菜', '水果', '坚果', '海鲜'
  ]
  private foodInfoArray: Array<string> = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
    'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ]

  private foodInfo2Array: Array<string> = [
    'A1', 'B1', 'C1', 'D1', 'E1', 'F1', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
    'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ]

  @Builder
  TabBar(name: string, index: number) {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Image($r("app.media.icon")).width(24).height(24)
      Text(name).fontColor(this.curIndex == index ? '#67c7ff' : '#999999').fontSize(24)
    }
  }

  @Builder
  FoodTab(name: string, index: number) {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Text(name).fontColor(this.foodCurIndex == index ? '#67c7ff' : '#999999').fontSize(24)
    }
  }

  @Builder
  foodItem(info: string) {
    Column() {
      Image($r("app.media.logo_quick_contacts")).width(52).height(52)
      Text(info).fontSize(24).width('100%').backgroundColor('#999999')
    }
  }

  @Builder
  Foods() {
    Tabs() {
      ForEach(this.foodTabArray, (item: string, index) => {
        TabContent() {
          Grid() {
            ForEach(this.foodCurIndex == 0 ? this.foodInfoArray : this.foodInfo2Array, (info: string, index) => {
              GridItem() {
                this.foodItem(info)
              }.width('100%').height(120).borderRadius(8).backgroundColor("#67c8ff")
            }, (info: string) => info)
          }.columnsTemplate('1fr 1fr 1fr').rowsGap(6).columnsGap(6).height('100%').margin(6)
        }.tabBar(this.FoodTab(item, index))
      }, (item: string) => item)
    }.barPosition(BarPosition.Start).onChange((index) => {
      this.foodCurIndex = index
    })
  }

  build() {
    Tabs() {
      TabContent() {
        this.Foods()
      }.tabBar(this.TabBar('主页', 0))
      TabContent() {
        Column().width('100%').height('100%').backgroundColor('#8000CB87')
      }.tabBar(this.TabBar('记录', 1))
    }.barPosition(BarPosition.End).onChange((index) => {
      this.curIndex = index
    })
  }
}
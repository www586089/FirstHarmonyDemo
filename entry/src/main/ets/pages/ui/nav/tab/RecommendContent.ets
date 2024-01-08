import hilog from '@ohos.hilog';
import { FavoritePage } from './FavoritePage';
import { InfoPage } from './InfoPage';
import { TopBarView } from './TopBarView';

@Component
export struct RecommendContent {
  @State index: number = 0;
  mineIndex: number = 0;
  @Prop @Watch('onIndexChange') curIndex: number = 0;

  onIndexChange() {
    if (this.curIndex == this.mineIndex) {
      hilog.info(100, "zfang", 'lifeCycle----> RecommendContent===>Visible')
    } else {
      hilog.info(100, "zfang", 'lifeCycle----> RecommendContent===>Hide')
    }
  }

  @Builder
  TopBar(tabArray: Array<TopBarItem>) {
    Row({ space: 20 }) {
      ForEach(tabArray,
        (item: TopBarItem) => {
          Text(item.name)
            .fontSize(this.index === item.id ? 24 : 18)
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .fontWeight(this.index === item.id ? FontWeight.Bold : FontWeight.Regular)
            .onClick(() => {
              this.index = item.id;
            })
        }, item => JSON.stringify(item))
    }
    .margin({ left: 12 })
    .width('100%')
    .height('7.2%')
  }
  onPageHide() {
    hilog.info(100, "zfang", 'lifeCycle----> RecommendContent===>onPageHide')
  }
  onPageShow() {
    hilog.info(100, "zfang", 'lifeCycle----> RecommendContent===>onPageShow')
  }

  aboutToAppear() {
    hilog.info(100, "zfang", 'lifeCycle----> RecommendContent===>aboutToAppear')
  }
  aboutToDisappear() {
    hilog.info(100, "zfang", 'lifeCycle----> RecommendContent===>aboutToDisappear')
  }
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start }) {
      // this.TopBar(tabData() )
      TopBarView({index: $index, tabArray: tabData()})
      Swiper() {
        FavoritePage()
        InfoPage()
      }
      .index(this.index)
      .indicator(false)
      .loop(false)
      .duration(300)
      .onChange((index: number) => {
        this.index = index;
      })
    }.padding({top: 48})
  }
}

function tabData(): TopBarItem[] {
  let tabDataArray: Array<TopBarItem> = [];
  const TOP_BAR_DATA = [
    { 'id': 0, 'name': '自选股' },
    { 'id': 1, 'name': '行情' }
  ]
  TOP_BAR_DATA.forEach(item => {
    tabDataArray.push(new TopBarItem(item.id, item.name));
  })
  return tabDataArray;
}

export class TopBarItem {
  id: number;
  name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}
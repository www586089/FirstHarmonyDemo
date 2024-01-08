import { DiscoveryPage } from './DiscoveryPage';
import { HomeView } from './HomeView';
import { MinePage } from './MinePage';
import { RecommendContent } from './RecommendContent';

@Entry
@Component
struct NestTabPage {

  tabsArray:string[] = ['首页', '推荐', '发现', '我的']
  @State curIndex: number = 0;


  @Builder
  tabBarBuilder(index: number) {
    Text(this.tabsArray[index]).fontSize(24).fontColor(this.curIndex == index ? '#333' : '#666')
  }

  build() {
    Row() {
      Column() {
        Tabs({ barPosition: BarPosition.End }) {
          ForEach(this.tabsArray, (tabInfo, index) => {
            TabContent() {
              /**
               * 注意：这里如果换成curIndex来判断，则会引起不必要的刷新
               */
              if (0 == index) {
                HomeView({mineIndex: 0, curIndex: this.curIndex})
              } else if (1 == index) {
                RecommendContent({mineIndex: 1, curIndex: this.curIndex}).backgroundColor('#1008a8f1')
              } else if (2 == index) {
                DiscoveryPage({mineIndex: 2, curIndex: this.curIndex}).backgroundColor('#801008a8f1')
              } else {
                MinePage({mineIndex: 3, curIndex: this.curIndex}).backgroundColor('#801008a8f1')
              }
            }.tabBar(this.tabBarBuilder(index))
          }, (item) => JSON.stringify(item))
        }
        .onChange((index) => {
          this.curIndex = index
        })
        .scrollable(true)//todo 为true时外层tab不能滑动到内层tab

      }
      .width('100%')
    }
    .height('100%')
  }
}
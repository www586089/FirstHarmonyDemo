import { TopBarItem } from './RecommendContent';

@Component
export struct TopBarView {
  @Link index: number;
  tabArray: Array<TopBarItem>
  build() {
    Row({ space: 20 }) {
      ForEach(this.tabArray,
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
}
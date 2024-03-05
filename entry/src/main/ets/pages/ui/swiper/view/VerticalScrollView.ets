import { SectorBean, SectorItemData } from './SectorItemData'

@Preview
@Component
export struct VerticalScrollView {
  private swiperController: SwiperController = new SwiperController()
  @Prop
  private data: SectorBean = new SectorBean()


  build() {
    Row() {
      Image($r('app.media.app_icon')).width(72).height(12)
      Swiper(this.swiperController) {
        ForEach(this.data.items.convertToArray(), (item: SectorItemData, index) => {
          Row() {
            Text(item.area)
              .height(12)
              .backgroundColor('#1067c8ff')
              .fontColor('#175DE6')
              .borderColor('#175DE6')
              .borderWidth(0.5)
              .borderRadius(1)
              .textAlign(TextAlign.Center)
              .fontSize(9).margin({right: 8})
            Text(item.topItem).fontColor(Color.Black).fontSize(13).margin({right: 8})
            Text(item.change).fontColor('#E03136').fontSize(15).margin({right: 8})
            Image($r('app.media.icon_button_more')).width(16).height(18)
          }.justifyContent(FlexAlign.End).padding({ left: 16, right: 16 }).height('100%')
        }, (item: SectorItemData) => JSON.stringify(item))
      }
      .loop(true)
      .autoPlay(true)
      .interval(5000)
      .vertical(true)
      .indicator(false)
      .width(0)
      .layoutWeight(1)
    }
    .width('100%')
    .height(40)
    .alignSelf(ItemAlign.Start)
    .borderColor('#999')
    .borderWidth(1)
    .borderRadius(12)
  }
}
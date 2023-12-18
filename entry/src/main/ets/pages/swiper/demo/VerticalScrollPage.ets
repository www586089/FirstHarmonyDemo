import { getTestData } from '../view/SectorItemData'
import { VerticalScrollView } from '../view/VerticalScrollView'

@Entry
@Component
struct VerticalScrollPage {

  private swiperController: SwiperController = new SwiperController()

  build() {
    Row() {
      Column() {
        VerticalScrollView({data: getTestData()}).padding({left: 16, right: 16})
      }
      .width('100%').height('20%').alignSelf(ItemAlign.Start).padding({top: 24, bottom: 24})
    }
    .height('100%')
  }
}
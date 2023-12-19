import { WindowManager } from '../../window/WindowManger'

@Entry
@Component
struct BasicWindowDemoPage {
  @State message: string = 'Create SubWindow'

  build() {
    Row() {
      Column({space: 12}) {
        Text(this.message)
          .fontSize(24).onClick(() => {
              WindowManager.getInstance().createSubWindow()
          }).backgroundColor('#67C8FF').padding({left: 24, right: 24, top: 12, bottom: 12})
      }.justifyContent(FlexAlign.Start)
      .width('100%').height('100%')
    }
    .height('100%').margin({top: 48})
  }

  aboutToDisappear() {
    WindowManager.getInstance().destroySubWindow()
  }
}
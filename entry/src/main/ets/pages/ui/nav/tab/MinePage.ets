import hilog from '@ohos.hilog';


@Component
export struct MinePage {
  @State message: string = 'Discovery Page'
  mineIndex: number = 0;
  @Prop @Watch('onIndexChange') curIndex: number = 0;

  onIndexChange() {
    if (this.curIndex == this.mineIndex) {
      hilog.info(100, "zfang", 'lifeCycle----> MinePage===>Visible')
    } else {
      hilog.info(100, "zfang", 'lifeCycle----> MinePage===>Hide')
    }
  }
  onPageHide() {
    hilog.info(100, "zfang", 'lifeCycle----> MinePage===>onPageHide')
  }
  onPageShow() {
    hilog.info(100, "zfang", 'lifeCycle----> MinePage===>onPageShow')
  }

  aboutToAppear() {
    hilog.info(100, "zfang", 'lifeCycle----> MinePage===>aboutToAppear')
  }
  aboutToDisappear() {
    hilog.info(100, "zfang", 'lifeCycle----> MinePage===>aboutToDisappear')
  }
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
import hilog from '@ohos.hilog';


@Component
export struct DiscoveryPage {
  @State message: string = 'Discovery Page'
  mineIndex: number = 0;
  @Prop @Watch('onIndexChange') curIndex: number = 0;

  onIndexChange() {
    if (this.curIndex == this.mineIndex) {
      hilog.info(100, "zfang", 'lifeCycle----> DiscoveryPage===>Visible')
    } else {
      hilog.info(100, "zfang", 'lifeCycle----> DiscoveryPage===>Hide')
    }
  }
  onPageHide() {
    hilog.info(100, "zfang", 'lifeCycle----> DiscoveryPage===>onPageHide')
  }
  onPageShow() {
    hilog.info(100, "zfang", 'lifeCycle----> DiscoveryPage===>onPageShow')
  }

  aboutToAppear() {
    hilog.info(100, "zfang", 'lifeCycle----> DiscoveryPage===>aboutToAppear')
  }
  aboutToDisappear() {
    hilog.info(100, "zfang", 'lifeCycle----> DiscoveryPage===>aboutToDisappear')
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
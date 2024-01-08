import hilog from '@ohos.hilog';

@Component
export struct HomeView {
  @State index: number = 0;
  mineIndex: number = 0;
  @Prop @Watch('onIndexChange') curIndex: number = 0;

  onIndexChange() {
    if (this.curIndex == this.mineIndex) {
      hilog.info(100, "zfang", 'lifeCycle----> HomeView===>Visible')
    } else {
      hilog.info(100, "zfang", 'lifeCycle----> HomeView===>Hide')
    }
  }
  onPageHide() {
    hilog.info(100, "zfang", 'lifeCycle----> HomeView===>onPageHide')
  }
  onPageShow() {
    hilog.info(100, "zfang", 'lifeCycle----> HomeView===>onPageShow')
  }

  aboutToAppear() {
    hilog.info(100, "zfang", 'lifeCycle----> HomeView===>aboutToAppear')
  }
  aboutToDisappear() {
    hilog.info(100, "zfang", 'lifeCycle----> HomeView===>aboutToDisappear')
  }
  build() {
    Column(){
      Tabs(){
        TabContent() {
          Text('关注的内容').fontSize(30)
        }
        .tabBar('关注')

        TabContent() {
          Text('游戏的内容').fontSize(30)
        }
        .tabBar('游戏')
        TabContent() {
          Text('游戏的内容').fontSize(30)
        }
        .tabBar('视频')
        TabContent() {
          Text('游戏的内容').fontSize(30)
        }
        .tabBar('数码')
        TabContent() {
          Text('科技的内容').fontSize(30)
        }
        .tabBar('科技')
      }
    }
    .backgroundColor('#ff08a8f1')
    .width('100%').padding({top: 48})
  }
}
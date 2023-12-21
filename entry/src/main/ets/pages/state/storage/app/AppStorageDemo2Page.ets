
class ViewData {
  title: string;
  uri: Resource;
  color: Color = Color.Black;

  constructor(title: string, uri: Resource) {
    this.title = title;
    this.uri = uri
  }
}

/**
 * 事件通知的反例
 * 不建议借助@StorageLink的双向同步机制实现事件通知
 */
@Entry
@Component
struct AppStorageDemo2Page {
  dataList: Array<ViewData> = [
    new ViewData('flower', $r('app.media.icon')),
    new ViewData('OMG', $r('app.media.icon')),
    new ViewData('OMG', $r('app.media.icon'))]
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      Grid(this.scroller) {
        ForEach(this.dataList, (item: ViewData, index?: number) => {
          GridItem() {
            TapImage({
              uri: item.uri,
              index: index
            })
          }.aspectRatio(1)

        }, (item: ViewData, index?: number) => {
          return JSON.stringify(item) + index;
        })
      }.columnsTemplate('1fr 1fr')
    }
  }
}

/**
 * TapImage中的点击事件，会触发AppStorage中tapIndex对应属性的改变。
 * 因为@StorageLink是双向同步，修改会同步回AppStorage中，所以，
 * 所有绑定AppStorage的tapIndex自定义组件都会被通知UI刷新。
 * UI刷新带来的成本是巨大的，因此不建议开发者使用此方式来实现基本的事件通知功能。
 */
@Component
export struct TapImage {
  @StorageLink('tapIndex') @Watch('onTapIndexChange') tapIndex: number = -1;
  @State tapColor: Color = Color.Black;
  private index: number = 0;
  private uri: Resource = {
    id: 0,
    type: 0,
    moduleName: "",
    bundleName: ""
  };

  // 判断是否被选中
  onTapIndexChange() {
    if (this.tapIndex >= 0 && this.index === this.tapIndex) {
      console.info(`tapindex: ${this.tapIndex}, index: ${this.index}, red`)
      this.tapColor = Color.Red;
    } else {
      console.info(`tapindex: ${this.tapIndex}, index: ${this.index}, black`)
      this.tapColor = Color.Black;
    }
  }

  build() {
    Column() {
      Image(this.uri)
        .objectFit(ImageFit.Cover)
        .onClick(() => {
          this.tapIndex = this.index;
        })
        .border({ width: 5, style: BorderStyle.Dotted, color: this.tapColor })
    }

  }
}
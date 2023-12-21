// xxx.ets
class Demo4ViewData {
  title: string;
  uri: Resource;
  color: Color = Color.Black;

  constructor(title: string, uri: Resource) {
    this.title = title;
    this.uri = uri
  }
}

/**
 * 三元表达式修改状态
 */
@Entry
@Component
struct AppStorageDemo4Page {
  dataList: Array<Demo4ViewData> = [
    new Demo4ViewData('flower', $r('app.media.icon')),
    new Demo4ViewData('OMG', $r('app.media.icon')),
    new Demo4ViewData('OMG', $r('app.media.icon'))]
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      Grid(this.scroller) {
        ForEach(this.dataList, (item: Demo4ViewData, index?: number) => {
          GridItem() {
            Demo4TapImage({
              uri: item.uri,
              index: index
            })
          }.aspectRatio(1)

        }, (item: Demo4ViewData, index?: number) => {
          return JSON.stringify(item) + index;
        })
      }.columnsTemplate('1fr 1fr')
    }

  }
}

@Component
export struct Demo4TapImage {
  @StorageLink('tapIndex') tapIndex: number = -1;
  @State tapColor: Color = Color.Black;
  private index: number = 0;
  private uri: Resource = {
    id: 0,
    type: 0,
    moduleName: "",
    bundleName: ""
  };

  build() {
    Column() {
      Image(this.uri)
        .objectFit(ImageFit.Cover)
        .onClick(() => {
          this.tapIndex = this.index;
        })
        .border({
          width: 5,
          style: BorderStyle.Dotted,
          color: (this.tapIndex >= 0 && this.index === this.tapIndex) ? Color.Red : Color.Black
        })
    }
  }
}
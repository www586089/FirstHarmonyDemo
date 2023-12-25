import { StringData } from './base/LazyData';
import { ComplexDataSource } from './base/LazyForeach';

@Entry
@Component
struct LazyRenderDemo4Page {
  private moved: number[] = [];
  private data: ComplexDataSource = new ComplexDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(new StringData(`Hello ${i}`, $r('app.media.girl1')));
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: StringData, index: number) => {
        ListItem() {
          Column() {
            Text(item.message).fontSize(50)
              .onAppear(() => {
                console.info("appear:" + item.message)
              })
            Image(item.imgSrc)
              .width(500)
              .height(200)
          }.margin({ left: 10, right: 10 })
        }
        .onClick(() => {
          item.message += '00';
          this.data.reloadData();
        })
      }, (item: StringData, index: number) => JSON.stringify(item))
    }.cachedCount(5).width('100%').height('100%')
  }
}
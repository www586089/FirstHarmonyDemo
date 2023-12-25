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
          LazyDemo4ChildComponent({data: item})
        }
        .onClick(() => {
          item.message += '00';
          this.data.reloadData();
        })
      }, (item: StringData, index: number) => {
        //key不变，此时只更新相关item的数据
        return index.toString()
      })
    }.cachedCount(5).width('100%').height('100%')
  }
}

@Component
struct LazyDemo4ChildComponent {
  @ObjectLink data: StringData
  build() {
    Column() {
      Text(this.data.message).fontSize(50)
        .onAppear(() => {
          console.info("appear:" + this.data.message)
        })
      Image(this.data.imgSrc)
        .width(500)
        .height(200)
    }.margin({ left: 10, right: 10 })
  }
}
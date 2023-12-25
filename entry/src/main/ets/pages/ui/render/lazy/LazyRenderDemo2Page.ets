import { StringData } from './base/LazyData';
import { ComplexDataSource } from './base/LazyForeach';

@Entry
@Component
struct LazyRenderDemo2Page {
  private moved: number[] = [];
  @State data: ComplexDataSource = new ComplexDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(new StringData(`Hello ${i}`));
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: StringData, index: number) => {
        ListItem() {
          LazyDemo2ChildComponent({data: item})
        }
        .onClick(() => {
          item.message += '0';
        })
      }, (item: StringData, index: number) => index.toString())
    }.cachedCount(5).width('100%').height('100%')
  }
}

@Component
struct LazyDemo2ChildComponent {
  @ObjectLink data: StringData
  build() {
    Row() {
      Text(this.data.message).fontSize(50)
        .onAppear(() => {
          console.info("appear:" + this.data.message)
        })
    }.margin({ left: 10, right: 10 })
  }
}
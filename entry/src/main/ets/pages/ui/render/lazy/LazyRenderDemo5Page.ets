import { NestedString, StringDataV2 } from './base/LazyData';
import { MyDataSource } from './base/LazyForeach';

@Entry
@Component
struct LazyRenderDemo5Page {
  @State data: MyDataSource<StringDataV2> = new MyDataSource<StringDataV2>();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(new StringDataV2(new NestedString(`Hello ${i}`)));
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: StringDataV2, index: number) => {
        ListItem() {
          LazyRenderDemo5ChildComponent({data: item})
        }
        .onClick(() => {
          // item.message.message += '0';
          item.message = new NestedString(item.message.message + '0');
        })
      }, (item: StringDataV2, index: number) => item.toString() + index.toString())
    }.cachedCount(5).width('100%').width('100%')
  }
}

@Component
struct LazyRenderDemo5ChildComponent {
  @ObjectLink data: StringDataV2
  build() {
    Row() {
      Text(this.data.message.message).fontSize(50)
        .onAppear(() => {
          console.info("appear:" + this.data.message.message)
        })
    }.margin({ left: 10, right: 10 })
  }
}

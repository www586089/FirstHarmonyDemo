import { SimpleStringDataSource } from './base/LazyForeach';

@Entry
@Component
struct LazyForEachDemo3Page {
  private data: SimpleStringDataSource = new SimpleStringDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: string, index: number) => {
        ListItem() {
          Row() {
            Text(item).fontSize(50)
              .onAppear(() => {
                console.info("appear:" + item)
              })
          }.margin({ left: 10, right: 10 })
        }
        .onClick(() => {
          // 点击删除子组件
          this.data.deleteData(index);
          // 重置所有子组件的index索引
          // this.data.reloadData();
        })
      }, (item: string, index: number) => item + index.toString())
    }.cachedCount(5).width('100%').height('100%')
  }
}
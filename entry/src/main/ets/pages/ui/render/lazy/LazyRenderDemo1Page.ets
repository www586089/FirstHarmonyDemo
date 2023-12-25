import { MyDataSource } from './base/LazyForeach';

@Entry
@Component
struct LazyRenderDemo1Page {
  private data: MyDataSource = new MyDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: string) => {
        ListItem() {
          Row() {
            Text(item).fontSize(50)
              .onAppear(() => {
                console.info("appear:" + item)
              })
          }.margin({ left: 10, right: 10 })
        }
      }, (item: string) => item)
      /**
       * 键值相同时UI渲染不正常
       */
      // LazyForEach(this.data, (item: string) => {
      //   ListItem() {
      //     Row() {
      //       Text(item).fontSize(50)
      //         .onAppear(() => {
      //           console.info("appear:" + item)
      //         })
      //     }.margin({ left: 10, right: 10 })
      //   }
      // }, (item: string) => 'same key')
    }.cachedCount(5).height('100%').width('100%')
  }
}
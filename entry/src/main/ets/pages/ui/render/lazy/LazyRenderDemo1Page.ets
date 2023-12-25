import { MyDataSource } from './base/LazyForeach';

@Entry
@Component
struct LazyRenderDemo1Page {
  private data: MyDataSource = new MyDataSource();
  private isChange: boolean = true;

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    Stack() {
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

      Flex({direction: FlexDirection.Column}) {
        Text('添加').fontSize(24).width('20%').height(48).onClick(() => {
          // 点击追加子组件
          this.data.pushData(`Hello ${this.data.totalCount()}`);
        })
        Text('删除').fontSize(24).width('20%').height(48).onClick(() => {
          // 点击删除子组件
          if (this.data.totalCount() <= 0) {
            return
          }
          let item: string = this.data.getData(0)
          this.data.deleteData(this.data.dataArray.indexOf(item));
        })
        Text('改变单个数据').fontSize(24).width('20%').height(48).onClick(() => {
          // 点击删除子组件
          if (this.data.totalCount() <= 0) {
            return
          }
          let index = 0;
          let item: string = this.data.getData(index)
          if (this.isChange) {
            this.data.changeData(index, item + '00');
          } else {
            this.data.changeData(index, `Hello ${index}`);
          }
          this.isChange = !this.isChange;
        })

        Text('改变所有').fontSize(24).width('20%').height(48).onClick(() => {
          this.data.modifyAllData();
          this.data.reloadData()
        })
      }.backgroundColor("#67c8ff")
    }.alignContent(Alignment.End).margin({top: 48})
  }
}
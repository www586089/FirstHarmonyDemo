let storage4 = new LocalStorage({ countStorage: 1 });

/**
 * 兄弟节点之间同步状态变量
 */
@Component
struct LocalStorageChild4 {
  // 子组件实例的名字
  label: string = 'no name';
  // 和LocalStorage中“countStorage”的双向绑定数据
  @LocalStorageLink('countStorage') playCountLink: number = 0;

  build() {
    Row() {
      Text(this.label)
        .width(50).height(60).fontSize(12)
      Text(`playCountLink ${this.playCountLink}: inc by 1`)
        .onClick(() => {
          this.playCountLink += 1;
        })
        .width(200).height(60).fontSize(12)
    }.width(300).height(60)
  }
}

@Entry(storage4)
@Component
struct LocalStorageDemo4Page {
  @LocalStorageLink('countStorage') playCount: number = 0;

  build() {
    Column() {
      Row() {
        Text('Parent')
          .width(50).height(60).fontSize(12)
        Text(`playCount ${this.playCount} dec by 1`)
          .onClick(() => {
            this.playCount -= 1;
          })
          .width(250).height(60).fontSize(12)
      }.width(300).height(60).margin({top: 48})

      Row() {
        Text('LocalStorage')
          .width(50).height(60).fontSize(12)
        Text(`countStorage ${this.playCount} incr by 1`)
          .onClick(() => {
            storage4.set<number>('countStorage', 1 + storage4.get<number>('countStorage'));
          })
          .width(250).height(60).fontSize(12)
      }.width(300).height(60)

      LocalStorageChild4({ label: 'ChildA' })
      LocalStorageChild4({ label: 'ChildB' })

      Text(`playCount in LocalStorage for debug ${storage4.get<number>('countStorage')}`)
        .width(300).height(60).fontSize(12)
    }
  }
}
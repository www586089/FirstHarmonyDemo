PersistentStorage.PersistProp('aPersistProp', 47);

@Entry
@Component
struct PersistStorageDemo2Page {
  @State message: string = 'Hello World'
  @StorageLink('aPersistProp') aPersistProp: number = 48

  build() {
    Row() {
      Column() {
        Text(this.message)
        // 应用退出时会保存当前结果。重新启动后，会显示上一次的保存结果
        Text(`${this.aPersistProp}`)
          .onClick(() => {
            this.aPersistProp += 1;
          })
          .fontSize(24)
          .fontColor(Color.White)
          .backgroundColor('#67c8ff')
          .width('40%')
          .height(52)
      }
    }.margin({ top: 48 })
  }
}
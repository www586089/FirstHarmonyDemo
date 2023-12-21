// 通过GetShared接口获取stage共享的LocalStorage实例
let shareStorage = LocalStorage.GetShared()

@Entry(shareStorage)
@Component
struct ShareStorageDemoPage {
  // can access LocalStorage instance using
  // @LocalStorageLink/Prop decorated variables
  @LocalStorageLink('PropShareA') propShareA: number = 3;

  build() {
    Row() {
      Column() {
        Text(`${this.propShareA}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
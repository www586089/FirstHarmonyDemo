@Entry
@Component
struct WatchDemoPage {
  @State @Watch('onChange') num: number = 1
  @State @Watch('onChange') power: number = 2
  @State result: number = 1

  onChange() {
    this.result = Math.pow(this.num, this.power)
  }

  build() {
    Row() {
      Column() {
        Text('演示@Watch装饰器的使用：\n 装饰的数据变化时会触发一个函数' +
          '，可以在触发的函数中作一些业务逻辑。')
        Text(`基数: ${this.num}`).commonStyle()
          .fontSize(24)
          .onClick(() => {
            this.num++;
          })
        Divider()
        Text(`次数: ${this.power}`).fontSize(24).commonStyle().onClick(() => {
          this.power++;
        })
        Divider()
        Text(`一个长长的结果: ${this.result}`)
          .fontSize(24)
          .maxFontSize(24)
          .minFontSize(12)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .commonStyle()
      }
      .width('100%')
    }
    .height('100%')
  }

  @Styles
  commonStyle() {
    .backgroundColor('#67c8ff')
    .width('40%')
    .height(52)
    .borderRadius(26)
  }
}
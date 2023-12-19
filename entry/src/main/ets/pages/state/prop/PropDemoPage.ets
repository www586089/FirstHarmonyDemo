@Entry
@Component
struct PropDemoPage {
  @State message: string = '演示@Prop装饰器的使用：\n该装饰器用于实现修改父组件' +
    '然后子组件自动更新的单向联动（子组件数据更新不会反馈到父组件中）'
  @State index: number = 0

  build() {
    Row() {
      Column() {
        Text(this.message).letterSpacing(2)
        Text(`${this.index}`)
          .fontSize(48)
          .fontColor(Color.Pink)
          .padding(5)
          .backgroundColor("#67c8ff")
          .onClick(() => {
            this.index++
          })
        Divider()
        ChildView({ indexProp: this.index })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ChildView {
  @Prop
  indexProp: number

  build() {
    Row() {
      Text(`${this.indexProp}`)
        .fontSize(24)
        .fontColor(Color.Pink)
        .padding(8)
        .backgroundColor("#8067c8ff")
        .onClick(() => {
          this.indexProp++
        })
    }
  }
}
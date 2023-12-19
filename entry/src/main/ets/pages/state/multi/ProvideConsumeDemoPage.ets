@Entry
@Component
struct ProvideConsumeDemoPage {
@Provide('provideKey') provideContent: string = "Provider Content"

  build() {
    Row() {
      Column() {
        Text('演示@Provide @Consume 如何跨组件传递数据（双向联动）')
        Text(`Container Content: ${this.provideContent}`)
          .fontSize(30)
          .fontColor("#67c8ff")
          .padding(12)
          .width('80%')
          .height(80)
          .backgroundColor(Color.Pink).onClick(() => {
              this.provideContent = 'From Top'
          })
        Divider().color(Color.Red)
        ProviderViewParent()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ProviderViewParent {
  build() {
    Column() {
      Text("Parent: Content")
        .fontSize(24)
        .fontColor("#8067c8ff")
        .padding(12)
        .width('60%')
        .height(60)
        .backgroundColor(Color.Orange)
      Divider().color(Color.Red)
      ProviderViewChild()
    }
  }
}

@Component
struct ProviderViewChild {
  @Consume('provideKey')
  provideContent: string

  build() {
    Column() {
      Text(`Child Content:${this.provideContent}`)
        .fontColor(12)
        .fontSize(12)
        .fontColor(Color.White)
        .padding(12)
        .width('60%')
        .height(40)
        .backgroundColor(Color.Gray)
        .onClick(() => {
            this.provideContent = 'ArkTS UI'
        })
    }
  }
}
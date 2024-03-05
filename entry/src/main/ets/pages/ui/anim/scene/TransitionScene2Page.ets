@Entry
@Component
struct TransitionScene2Page {
  @State poem: string[] = [
    '春眠不觉晓', '处处闻笛鸟', '夜来风雨声', '花落知多少'
  ]

  private index: number = 0;

  build() {
    Column({ space: 10 }) {
      Column() {
        ForEach(this.poem, (item: string, index) => {
          Text(item).fetchText()
            .transition({
              type: TransitionType.All,
              translate: { x: 200, y: 100 }
            })
        }, (item: string) => JSON.stringify(item))
      }.fetchColumn()

      Button('向头部添加元素').fetchButton(Color.Orange, () => {
        animateTo({}, () => {
          this.poem.unshift('窗前明月光' + this.index++)
          console.log(this.poem.toString())
        })
      })
      Button('向尾部添加元素').fetchButton(Color.Green, () => {
        animateTo({}, () => {
          this.poem.push('低头思故乡' + this.index++)
        })
      })
      Button('删除头部元素').fetchButton(Color.Blue, () => {
        animateTo({}, () => {
          this.poem.shift()
        })
      })
      Button('删除尾部元素').fetchButton(Color.Red, () => {
        animateTo({}, () => {
          this.poem.pop()
        })
      })
    }
    .width('100%').height('100%')
  }
}

@Extend(Column)
function fetchColumn() {
  .margin(10)
  .justifyContent(FlexAlign.Start)
}

@Extend(Text)
function fetchText() {
  .backgroundColor('#882211')
  .width('80%')
  .padding({ bottom: 12, top: 12 })
  .margin({ bottom: 12 })
  .textAlign(TextAlign.Center)
  .borderRadius(24)
  .fontColor(Color.White)
}

@Extend(Button)
function fetchButton(bgColor: Color, action: Function) {
  .backgroundColor(bgColor)
  .width(200)
  .height(50)
  .fontSize(18)
  .onClick(() => {
    action()
  })
}
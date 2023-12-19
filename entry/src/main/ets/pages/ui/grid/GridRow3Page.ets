@Entry
@Component
/**
 * 当columns为自定义值，栅格布局在任何尺寸设备下都被分为columns列。下面分别设置栅格布局列数为4和8，子元素默认占一列，效果如下：
 */
struct GridRow3Page {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown, Color.Yellow];
  @State currentBp: string = 'unknown';

  build() {
    Row() {
      Column() {
        Row() {
          GridRow({ columns: 3, gutter: { x: 10, y: 20 } }) {
            ForEach(this.bgColors, (item, index) => {
              GridCol() {
                Row() {
                  Text(`${index + 1}`)
                }.width('100%').height('50')
              }.backgroundColor(item)
            })
          }
          .width('100%').height('100%')
          .onBreakpointChange((breakpoint) => {
            this.currentBp = breakpoint
          })
        }
        .height('40%')
        .border({ color: Color.Blue, width: 2 })
        .width('90%')

        Row() {
          GridRow({ columns: 8 }) {
            ForEach(this.bgColors, (item, index) => {
              GridCol() {
                Row() {
                  Text(`${index + 1}`)
                }.width('100%').height('50')
              }.backgroundColor(item)
            })
          }
          .width('100%').height('100%')
          .onBreakpointChange((breakpoint) => {
            this.currentBp = breakpoint
          })
        }
        .height('40%')
        .border({ color: Color.Blue, width: 2 })
        .width('90%')
      }
      .width('100%')
    }
    .height('100%')
  }
}
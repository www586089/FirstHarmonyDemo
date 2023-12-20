@Observed
class StringArray extends Array<String> {
}

@Component
struct ItemPage {
  @ObjectLink
  itemArr: StringArray;

  private scroller: Scroller = new Scroller()
  build() {
    Scroll(this.scroller) {
      Row() {
        Text('ItemPage')
          .width(100).height(100)

        ForEach(this.itemArr,
          item => {
            Text(item)
              .width(100).height(100)
          },
          item => item
        )
      }
    }.scrollable(ScrollDirection.Horizontal)
  }
}

/**
 * 二维数组变化监听，[bug]发现有性能问题
 */
@Entry
@Component
struct NestedObjectDemo2Page {
  @State arr: Array<StringArray> = [new StringArray(), new StringArray(), new StringArray()];

  build() {
    Column() {
      ItemPage({ itemArr: this.arr[0] })
      ItemPage({ itemArr: this.arr[1] })
      ItemPage({ itemArr: this.arr[2] })

      Divider()

      ForEach(this.arr,
        (itemArr: StringArray, index: number) => {
          ItemPage({ itemArr: itemArr })
        },
        itemArr => itemArr[0]
      )

      Divider()

      Button('update')
        .onClick(() => {
          console.error('Update all items in arr');
          if (this.arr[0][0] !== undefined) {
            // 正常情况下需要有一个真实的ID来与ForEach一起使用，但此处没有
            // 因此需要确保推送的字符串是唯一的。
            this.arr[0].push(`${this.arr[0].slice(-1).pop()}${this.arr[0].slice(-1).pop()}`);
            this.arr[1].push(`${this.arr[1].slice(-1).pop()}${this.arr[1].slice(-1).pop()}`);
            this.arr[2].push(`${this.arr[2].slice(-1).pop()}${this.arr[2].slice(-1).pop()}`);
          } else {
            this.arr[0].push('Hello');
            this.arr[1].push('World');
            this.arr[2].push('!');
          }
        })
    }.margin({top: 48})
  }
}
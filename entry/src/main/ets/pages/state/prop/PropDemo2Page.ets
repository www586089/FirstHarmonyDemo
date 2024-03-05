@Entry
@Component
struct PropDemo2Page {
  @State arr: number[] = [1, 2, 3];

  build() {
    Row() {
      Column() {
        PropDemo2Child({ value: this.arr[0] })
        PropDemo2Child({ value: this.arr[1] })
        PropDemo2Child({ value: this.arr[2] })

        Divider().height(5)

        ForEach(this.arr,
          (item: number) => {
            PropDemo2Child({ value: item })
          },
          (item: number) => JSON.stringify(item)
        )
        Text('replace entire arr')
          .fontSize(50)
          .onClick(() => {
            // 两个数组都包含项“3”。
            this.arr = this.arr[0] == 1 ? [3, 4, 5] : [1, 2, 3];
          })
      }
    }
  }
}

@Component
struct PropDemo2Child {
  @Prop value: number;

  build() {
    Text(`${this.value}`)
      .fontSize(50)
      .onClick(() => {
        this.value++
      })
  }
}
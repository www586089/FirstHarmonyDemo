@Entry
@Component
struct RenderTestDemo1Page {
  @State count: number = 0;

  build() {
    Column() {
      Text(`count=${this.count}`)

      if (this.count > 0) {
        Text(`count is positive`)
          .fontColor(Color.Green)
      }

      Button('increase count')
        .onClick(() => {
          this.count++;
        }).margin({top: 12})

      Button('decrease count')
        .onClick(() => {
          this.count--;
        }).margin({top: 12})
    }
  }
}
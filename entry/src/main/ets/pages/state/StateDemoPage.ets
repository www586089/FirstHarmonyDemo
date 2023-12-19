import { ClassA, Model } from './model/Bean';

@Entry
@Component
struct StateDemoPage {
  private flag: boolean = true;
  //string number boolean 类型的数据可以被监听到更新
  @State index: number = 0
  // class类型 可以观察到自身的赋值的变化，和其属性赋值的变化
  @State title: Model = new Model('Hello', new ClassA('World'));
  /**
   * 1 数组自身的赋值可以观察到。
   * 2 数组项的赋值可以观察到。
   * 3 删除数组项可以观察到。
   * 4 新增数组项可以观察到。
   * 5 数组项中属性的赋值观察不到。（X）
   */
  @State array: Model[] = [new Model('a', new ClassA('xx')), new Model('b', new ClassA('yy'))]

  build() {
    Row() {
      Column({ space: 12 }) {
        Text(`${this.index}`).stateTextStyle(() => {
          this.index++
        })

        Text(`${this.title.key}-${this.title.value.subtitle}`).stateTextStyle(() => {
          if (this.flag) {
            this.title = new Model('World', new ClassA('Hello'))
          } else {
            this.title.key = 'World Change'
          }
          this.flag = !this.flag
          // 嵌套的属性赋值观察不到
          // this.title.name.value = 'ArkUI'
        })

        ForEach(this.array, (item: Model, index) => {
          Row() {
            Text(item.key).width('40%').fontSize(24).backgroundColor(Color.Orange)
            Text(item.value.subtitle).width('40%').fontSize(24).fontColor(Color.Red).backgroundColor(Color.Blue)
          }.backgroundColor('#8067c8ff').transition({ type: TransitionType.All, translate: {x: 200, y: 40} })
        }, item => JSON.stringify(item))

        Button('ClickMe')
          .backgroundColor('#67c8ff')
          .fontColor(Color.White)
          .borderRadius(12)
          .height(44)
          .padding({ left: 24, right: 24 })
          .onClick(() => {
            animateTo({}, () => {
              // this.array = [new Model('dd', new ClassA('zz')), new Model('mm', new ClassA('z1z1'))]
              // this.array[0] = new Model('AA', new ClassA('xx'))
              // this.array.unshift(new Model('AA', new ClassA('xx'))) //头部插入
              // this.array.shift()//头部删除
              // this.array.push(new Model('AA', new ClassA('xx'))) //尾部插入
              // this.array.pop()//尾部删除

              //元素中属性的赋值不能被观察到[所与可被观察到的属性一起使用的话，也可以被观察到]
              this.array[0].value.subtitle = 'Nested action'
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text)
function stateTextStyle(action: () => void) {
  .width('40%')
  .fontColor(Color.White)
  .backgroundColor('#67c8ff')
  .padding({ left: 12, right: 12, top: 8, bottom: 8 })
  .onClick(() => {
    action()
  })
}

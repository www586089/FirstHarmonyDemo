// objectLinkNestedObjects.ets
let id: number = 1;

/**
 * @Observed 使ClassA2属性的变化能被观察到
 */
@Observed
class ClassA2 {
  public id: number;
  public c: number;

  constructor(c: number) {
    this.id = id++;
    this.c = c;
  }
}

@Component
struct ViewA2 {
  // 子组件ViewA的@ObjectLink的类型是ClassA
  @ObjectLink a: ClassA2;
  label: string = 'ViewA1';

  build() {
    Row() {
      Button(`ViewA [${this.label}] this.a.c = ${this.a.c} +1`)
        .onClick(() => {
          this.a.c += 1;
        })
    }
  }
}

/**
 * 对象数组变化监听
 */
@Entry
@Component
struct ObjectArrayDemoPage {
  // ViewB中有@State装饰的ClassA[]
  @State arrA: ClassA2[] = [new ClassA2(0), new ClassA2(0)];

  build() {
    Column({ space: 10 }) {
      ForEach(this.arrA,
        (item: ClassA2) => {
          ViewA2({ label: `#${item.id}`, a: item })
        },
        (item: ClassA2) => item.id.toString()
      )
      // 使用@State装饰的数组的数组项初始化@ObjectLink，其中数组项是被@Observed装饰的ClassA的实例
      ViewA2({ label: `ViewA this.arrA[first]`, a: this.arrA[0] })
      ViewA2({ label: `ViewA this.arrA[last]`, a: this.arrA[this.arrA.length-1] })

      Button(`ViewB: reset array`)
        .onClick(() => {
          //数组赋值
          this.arrA = [new ClassA2(0), new ClassA2(0)];
        })
      Button(`ViewB: push`)
        .onClick(() => {
          //数组的变化[在数组末尾加一个元素]
          this.arrA.push(new ClassA2(0))
        })
      Button(`ViewB: shift`)
        .onClick(() => {
          //数组的变化[在数组头部删除一个元素]
          this.arrA.shift()
        })
      Button(`ViewB: chg item property in middle`)
        .onClick(() => {
          //数组中对象属性的赋值
          this.arrA[Math.floor(this.arrA.length / 2)].c = 10;
        })
      Button(`ViewB: chg item object in middle`)
        .onClick(() => {
          //对象数组的赋值
          this.arrA[Math.floor(this.arrA.length / 2)] = new ClassA2(11);
        })
    }.margin({top: 48})
  }
}
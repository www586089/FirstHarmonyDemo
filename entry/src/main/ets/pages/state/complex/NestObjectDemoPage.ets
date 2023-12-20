
let NextID: number = 1;

/**
 * @Observed 使ClassA属性的变化能被观察到
 */
@Observed
class ClassA {
  public id: number;
  public c: number;

  constructor(c: number) {
    this.id = NextID++;
    this.c = c;
  }
}

@Observed
class ClassB {
  public a: ClassA;

  constructor(a: ClassA) {
    this.a = a;
  }
}

@Component
struct ViewA {
  label: string = 'ViewA1';
  @ObjectLink a: ClassA;

  build() {
    Row() {
      Button(`ViewA [${this.label}] this.a.c=${this.a.c} +1`)
        .onClick(() => {
          this.a.c += 1;
        })
    }
  }
}

/**
 * 嵌套对象变化监听
 */
@Entry
@Component
struct NestObjectDemoPage {
  @State b: ClassB = new ClassB(new ClassA(0));

  build() {
    Column({ space: 10 }) {
      ViewA({ label: 'ViewA #1', a: this.b.a })
      ViewA({ label: 'ViewA #2', a: this.b.a })

      Button(`ViewB: this.b.a.c+= 1`)
        .onClick(() => {
          //嵌套属性变化
          this.b.a.c += 1;
        })
      Button(`ViewB: this.b.a = new ClassA(0)`)
        .onClick(() => {
          //属性对象赋值
          this.b.a = new ClassA(0);
        })
      Button(`ViewB: this.b = new ClassB(ClassA(0))`)
        .onClick(() => {
          //对象赋值
          this.b = new ClassB(new ClassA(0));
        })
    }.margin({top: 48})
  }
}
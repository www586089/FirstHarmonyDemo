
// 创建新实例并使用给定对象初始化
let storage2 = new LocalStorage({'PropA' : 47 } as Record<string, number>);

// 使LocalStorage可从@Component组件访问
@Entry(storage2)
@Component
struct LocalStorageDemo2Page {
  // @LocalStorageProp变量装饰器与LocalStorage中的'PropA'属性建立单向绑定
  @LocalStorageProp('PropA') storeProp1: number = 1;

  build() {
    Column({ space: 15 }) {
      // 点击后从47开始加1，只改变当前组件显示的storeProp1，不会同步到LocalStorage中
      Button(`Change from LocalStorageProp ${this.storeProp1}`)
        .onClick(() => {
          this.storeProp1 += 1
        })
      Button(`Change LocalStorage + 1`)
        .onClick(() => {
          //直接修改LocalStorage，会同步回@LocalStorageProp标记的属性
          let value: number = storage2.get('PropA') as number
          console.log(`value = ${value}`)
          storage2.set('PropA', value + 1)
        })
      LocalStorage2Child()
    }
  }
}

@Component
struct LocalStorage2Child {
  // @LocalStorageProp变量装饰器与LocalStorage中的'PropA'属性建立单向绑定
  @LocalStorageProp('PropA') storeProp2: number = 2;

  build() {
    Column({ space: 15 }) {
      // 当LocalStorageDemo2Page改变时，当前storeProp2不会改变，显示47
      Text(`Change from child LocalStorageProp ${this.storeProp2}`).onClick(() => {
          this.storeProp2 += 1
      })
    }
  }
}
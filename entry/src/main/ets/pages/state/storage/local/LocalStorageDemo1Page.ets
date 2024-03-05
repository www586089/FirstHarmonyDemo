
// 创建新实例并使用给定对象初始化
let storage = new LocalStorage({'PropA' : 47 } as Record<string, number>);

// 使LocalStorage可从@Component组件访问
@Entry(storage)
@Component
struct LocalStorageDemo1Page {
  // @LocalStorageProp变量装饰器与LocalStorage中的'PropA'属性建立单向绑定
  @LocalStorageLink('PropA') storeLink1: number = 1;

  build() {
    Column({ space: 15 }) {
      // 点击后从47开始加1，只改变当前组件显示的storeProp1，不会同步到LocalStorage中
      Button(`Change from LocalStorageProp ${this.storeLink1}`)
        .onClick(() => {
          this.storeLink1 += 1
        })
      Button(`Change LocalStorage + 1`)
        .onClick(() => {
          //直接修改LocalStorage，会同步回@LocalStorageProp标记的属性
          let value: number = storage.get('PropA') as number
          console.log(`value = ${value}`)
          storage.set('PropA', value + 1)
        })
      LocalStorageChild()
    }
  }
}

@Component
struct LocalStorageChild {
  // @LocalStorageProp变量装饰器与LocalStorage中的'PropA'属性建立单向绑定
  @LocalStorageLink('PropA') storeLink: number = 2;

  build() {
    Column({ space: 15 }) {
      // 当LocalStorageDemo1Page改变时，当前storeProp不会改变，显示47
      Text(`Change from child LocalStorageProp ${this.storeLink}`).onClick(() => {
        this.storeLink += 1
      })
    }
  }
}
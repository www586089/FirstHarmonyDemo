// 构造LocalStorage实例
let storage3 = new LocalStorage({ 'PropA': 47 } as Record<string, number>);
// 调用link（api9以上）接口构造'PropA'的双向同步数据，linkToPropA 是全局变量
let linkToPropA: SubscribedAbstractProperty<number> = storage3.link('PropA');

/**
 * @LocalStorageLink和LocalStorage双向同步的简单场景
 */
@Entry(storage3)
@Component
struct LocalStorageDemo3Page {
  // @LocalStorageLink('PropA')在LocalStorageDemo3Page自定义组件中创建'PropA'的双向同步数据，
  // 初始值为47，因为在构造LocalStorage已经给“PropA”设置47
  @LocalStorageLink('PropA') storeLink: number = 1;

  build() {
    Column({ space: 10 }) {
      Text(`incr @LocalStorageLink variable`)// 点击“incr @LocalStorageLink variable”，this.storeLink加1，
        // 改变同步回storage，全局变量linkToPropA也会同步改变
        .onClick(() => this.storeLink += 1).backgroundColor('#67c8ff')

      // 并不建议在组件内使用全局变量linkToPropA.get()，因为可能会有生命周期不同引起的错误。
      Text(`@LocalStorageLink: ${this.storeLink} - linkToPropA: ${linkToPropA.get()}`)
        .backgroundColor('#67c8ff')
    }
  }
}
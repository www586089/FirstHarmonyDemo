AppStorage.SetOrCreate('PropA', 47);
let pa48: Record<string, number> = { 'PropA': 48 };
let appStorage = new LocalStorage(pa48);

/**
 * 从UI内部使用AppStorage和LocalStorage
 */
@Entry(appStorage)
@Component
struct AppStorageDemo1Page {
  @StorageLink('PropA') storeLink: number = 1;
  @LocalStorageLink('PropA') localStoreLink: number = 1;

  build() {
    Column({ space: 20 }) {
      Text(`From AppStorage ${this.storeLink}`)
        .onClick(() => this.storeLink += 1)

      Text(`From LocalStorage ${this.localStoreLink}`)
        .onClick(() => {
          this.localStoreLink += 1;
          testAppStorage()
        })
    }.margin({top: 48})
  }
}

function testAppStorage() {
  AppStorage.SetOrCreate('appPropA', 47);

  let para: Record<string,number> = { 'appPropA': 17 };
  let storage: LocalStorage = new LocalStorage(para);
  // appPropA in AppStorage == 47, appPropA in LocalStorage == 17
  let appPropA: number = AppStorage.Get('appPropA') as number
  console.info(`appPropA in AppStorage = ${appPropA}, appPropA in LocalStorage = ${storage.get<number>('appPropA')}`)
  // link1.get() == 47
  let link1: SubscribedAbstractProperty<number> = AppStorage.Link('appPropA');
  // link2.get() == 47
  let link2: SubscribedAbstractProperty<number> = AppStorage.Link('appPropA');
  // prop.get() == 47
  let prop: SubscribedAbstractProperty<number> = AppStorage.Prop('appPropA');

  link1.set(48); // two-way sync: link1.get() == link2.get() == prop.get() == 48
  prop.set(1); // one-way sync: prop.get() == 1; but link1.get() == link2.get() == 48
  link1.set(49); // two-way sync: link1.get() == link2.get() == prop.get() == 49

  storage.get('appPropA') // == 17
  storage.set('appPropA', 101);
  storage.get('appPropA') // == 101

  AppStorage.Get('appPropA') // == 49
  link1.get() // == 49
  link2.get() // == 49
  prop.get() // == 49
}
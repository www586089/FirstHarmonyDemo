import router from '@ohos.router';


export class DataModelInfo {
  age: number;
}

export class DataModel {
  id: number;
  info: DataModelInfo;
}

@Entry
@Component
struct RouterWithParamsPage {
  @State message: string = '演示带参数传递'
  @State messageReturn: string =''

  // 在Home页面中
  paramsInfo: DataModel = {
  id: 123,
  info: {
    age: 20
  }
};

  onPageShow() {
    const params = router.getParams(); // 获取传递过来的参数对象
    if (null != params) {
      const personId = params['id']; // 获取id属性的值
      const personAge = params['info'].age; // 获取age属性的值
      this.messageReturn = `返回的参数：Id--->${personId}, Age--->${personAge}`
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.messageReturn).fontSize(20)
        Button('跳转').padding({left: 32, right: 32, top: 8, bottom: 8}).onClick(() => {
          router.pushUrl({url: "pages/router/ParamsShowPage", params: this.paramsInfo}, router.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info('Invoke pushUrl succeeded.');
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
import router from '@ohos.router';
import { DataModel } from './RouterWithParamsPage';

@Entry
@Component
struct ParamsShowPage {
  @State message: string = 'Hello World'

  paramsInfo: DataModel = {
    id: 456,
    info: {
      age: 40
    }
  };


  private personId:number = 0;
  private personAge: number;

  aboutToAppear() {
    const params = router.getParams(); // 获取传递过来的参数对象
    this.personId = params['id']; // 获取id属性的值
    this.personAge = params['info'].age; // 获取age属性的值
  }

  build() {

    Row() {
      Column() {
        Text(`Hello, My id is ${this.personId}, age is ${this.personAge}`)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Button('返回上一页').padding({left: 32, right: 32, top: 8, bottom: 8}).onClick(() => {
          router.back({
            url: `pages/router/RouterWithParamsPage`,
            params: this.paramsInfo
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
import { Base64Data } from './Base64Data';

@Entry
@Component
struct ImageBase64TestPage {
  @State base64Data: string = Base64Data.url1;

  build() {
    Row() {
      Column() {
        Image(this.base64Data).onClick(() => {
          this.base64Data = Base64Data.url2;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
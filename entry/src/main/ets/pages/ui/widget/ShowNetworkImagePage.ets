import http from '@ohos.net.http';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct ShowNetworkImagePage {
  @State image: PixelMap = undefined;

  aboutToAppear() {

  }
  build() {
    Row() {
      Stack() {
        Column() {
          Image(this.image)
        }
        .width('100%')
        Text('点击加载网络图片').onClick(() => {
          this.httpRequest()
        }).fontSize(32)
      }
    }
    .height('100%').backgroundColor('#8067c8ff')
  }

  httpRequest() {
    http.createHttp().request('https://lmg.jj20.com/up/allimg/1112/04051Z03929/1Z405003929-4-1200.jpg',
      (error, data) => {
        if (error) {
          console.error(`http reqeust failed with. Code: ${error.code}, message: ${error.message}`);
        } else {
          let code = data.responseCode;
          if (http.ResponseCode.OK === data.responseCode) {
            let res: any = data.result
            let imageSource = image.createImageSource(res);
            let options = {
              alphaType: 0,    // 透明度
              editable: false, // 是否可编辑
              pixelFormat: 3,  // 像素格式
              scaleMode: 1,    // 缩略值
              size: { height: 100, width: 100 }
            } // 创建图片大小
            imageSource.createPixelMap(options).then((pixelMap) => {
              this.image = pixelMap
            })
          }
        }
      }
    )
  }
}
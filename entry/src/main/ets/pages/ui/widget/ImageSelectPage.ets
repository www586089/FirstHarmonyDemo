import picker from '@ohos.file.picker';
import http from '@ohos.net.http';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct ImageSelectPage {
  @State imgDatas: string[] = [];
  @State image: PixelMap = null

  // 获取照片url集
  getAllImg() {

    let result = new Array<string>();
    try {
      let PhotoSelectOptions = new picker.PhotoSelectOptions();
      PhotoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
      PhotoSelectOptions.maxSelectNumber = 5;
      let photoPicker = new picker.PhotoViewPicker();
      photoPicker.select(PhotoSelectOptions).then((PhotoSelectResult) => {
        this.imgDatas = PhotoSelectResult.photoUris;
        console.info('PhotoViewPicker.select successfully, PhotoSelectResult uri: ' + JSON.stringify(PhotoSelectResult));
      }).catch((err) => {
        console.error(`PhotoViewPicker.select failed with. Code: ${err.code}, message: ${err.message}`);
      });
    } catch (err) {
      console.error(`PhotoViewPicker failed with. Code: ${err.code}, message: ${err.message}`);
    }
  }

  // aboutToAppear中调用上述函数，获取图库的所有图片url，存在imgDatas中
  async aboutToAppear() {
    this.getAllImg();
  }

  // 使用imgDatas的url加载图片。
  build() {
    Column() {
      if (null != this.image) {
        Image(this.image)
      }

      Grid() {
        ForEach(this.imgDatas, item => {
          GridItem() {
            Image(item)
              .width(200)
          }
        }, item => JSON.stringify(item))
      }
    }.width('100%').height('100%')
  }

  httpRequest() {
    http.createHttp().request("https://www.example.com/xxx.png",
      (error, data) => {
        if (error) {
          console.error(`http reqeust failed with. Code: ${error.code}, message: ${error.message}`);
        } else {
          let code = data.responseCode;
          if (http.ResponseCode.OK === data.responseCode) {
            let res: any = data.result
            let imageSource = image.createImageSource(res);
            let options = {
              alphaType: 0, // 透明度
              editable: false, // 是否可编辑
              pixelFormat: 3, // 像素格式
              scaleMode: 1, // 缩略值
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

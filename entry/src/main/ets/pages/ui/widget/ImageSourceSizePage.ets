@Entry
@Component
struct ImageSourceSizePage {
  @State message: string = 'Hello World'
  private imagrUrl:string = 'https://10wallpaper.com/wallpaper/1280x960/1605/Asian_fashion_beauty_model_photo_HD_Wallpapers_06_1280x960.jpg'

  build() {
    Column() {
      Row({ space: 20 }) {
        Image(this.imagrUrl)
          .sourceSize({
            width: 150,
            height: 150
          })
          .objectFit(ImageFit.ScaleDown)
          .width('25%')
          .aspectRatio(1)
          .border({ width: 1 })
          .overlay('width:150 height:150', { align: Alignment.Bottom, offset: { x: 0, y: 40 } })
        Image(this.imagrUrl)
          .sourceSize({
            width: 400,
            height: 400
          })
          .objectFit(ImageFit.ScaleDown)
          .width('25%')
          .aspectRatio(1)
          .border({ width: 1 })
          .overlay('width:400 height:400', { align: Alignment.Bottom, offset: { x: 0, y: 40 } })
      }
      .height(150)
      .width('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor("#dfaaaa")

    }
  }
}
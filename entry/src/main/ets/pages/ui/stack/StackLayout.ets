@Entry
@Component
struct StackLayout {
  @State message: string = 'Hello World'

  build() {
    Column(){
      Stack({ }) {
        Column(){}.width('90%').height('100%').backgroundColor('#ff58b87c')
        Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')
        Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000')
      }.width('100%').alignContent(Alignment.Center).height(150).margin({ top: 50, left: 5, right: 5})
    }
  }
}
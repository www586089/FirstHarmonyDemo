@Entry
@Component
struct ShapeTest1Page {

  private scroller: Scroller = new Scroller()
  build() {
    Scroll(this.scroller) {
      Column({space: 10}) {
        // 画一个宽高都为150的圆
        Text('原始尺寸Circle组件')
        Circle({width: 75, height: 75}).fill('#E87361')

        Row({space:10}) {
          Column() {
            // 创建一个宽高都为150的shape组件，背景色为黄色，一个宽高都为75的viewport。
            // 用一个蓝色的矩形来填充viewport，在viewport中绘制一个直径为75的圆。
            // 绘制结束，viewport会根据组件宽高放大两倍
            Text('shape内放大的Circle组件')
            Shape() {
              Rect().width('100%').height('100%').fill('#0097D4')
              Circle({width: 75, height: 75}).fill('#E87361')
            }
            .viewPort({x: 0, y: 0, width: 75, height: 75})
            .width(150)
            .height(150)
            .backgroundColor('#F5DC62')
          }
          Column() {
            // 创建一个宽高都为150的shape组件，背景色为黄色，一个宽高都为300的viewport。
            // 用一个绿色的矩形来填充viewport，在viewport中绘制一个直径为75的圆。
            // 绘制结束，viewport会根据组件宽高缩小两倍。
            Text('Shape内缩小的Circle组件')
            Shape() {
              Rect().width('100%').height('100%').fill('#BDDB69')
              Circle({width: 75, height: 75}).fill('#E87361')
            }
            .viewPort({x: 0, y: 0, width: 300, height: 300})
            .width(150)
            .height(150)
            .backgroundColor('#F5DC62')
          }
        }

        /**
         * 创建一个宽高都为300的shape组件，背景色为黄色，一个宽高都为300的viewport。
         * 用一个蓝色的矩形来填充viewport，在viewport中绘制一个半径为75的圆。
         */
        Shape() {
          Rect().width("100%").height("100%").fill("#0097D4")
          Circle({ width: 150, height: 150 }).fill("#E87361")
        }
        .viewPort({ x: 0, y: 0, width: 300, height: 300 })
        .width(300)
        .height(300)
        .backgroundColor("#F5DC62")

        /**
         * 创建一个宽高都为300的shape组件，背景色为黄色，创建一个宽高都为300的viewport。
         * 用一个蓝色的矩形来填充viewport，在viewport中绘制一个半径为75的圆，
         * 将viewport向右方和下方各平移150。
         */
        Shape() {
          Rect().width("100%").height("100%").fill("#0097D4")
          Circle({ width: 150, height: 150 }).fill("#E87361")
        }
        .viewPort({ x: -150, y: -150, width: 300, height: 300 })
        .width(300)
        .height(300)
        .backgroundColor("#F5DC62")

        Path()
          .width(100)
          .height(100)
          .commands('M150 0 L300 300 L0 300 Z')
          .fill("#E87361")

        Path()
          .width(100)
          .height(100)
          .fillOpacity(0)
          .commands('M150 0 L300 300 L0 300 Z')
          .stroke(Color.Red)

        Shape() {
          Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
        }
        .viewPort({ x: -80, y: -5, width: 500, height: 300 })
        .fill(0x317AF7)
        .stroke(Color.Red)
        .strokeWidth(3)
        .strokeLineJoin(LineJoinStyle.Miter)
        .strokeMiterLimit(5)

        Path()
          .width(100)
          .height(100)
          .fillOpacity(0)
          .commands('M150 0 L300 300 L0 300 Z')
          .stroke(Color.Red)
          .strokeWidth(10)
          .strokeOpacity(0.2)

        Polyline()
          .width(100)
          .height(100)
          .fillOpacity(0)
          .stroke(Color.Red)
          .strokeWidth(8)
          .points([[20, 0], [0, 100], [100, 90]])
            // 设置折线拐角处为圆弧
          .strokeLineJoin(LineJoinStyle.Round)

        Polyline()
          .width(100)
          .height(100)
          .fillOpacity(0)
          .stroke(Color.Red)
          .strokeWidth(10)
          .points([[20, 0], [20, 100], [100, 100]])
            // 设置折线拐角处为尖角
          .strokeLineJoin(LineJoinStyle.Miter)
            // 设置斜接长度与线宽的比值
          .strokeMiterLimit(1/Math.sin(45))
        Polyline()
          .width(100)
          .height(100)
          .fillOpacity(0)
          .stroke(Color.Red)
          .strokeWidth(10)
          .points([[20, 0], [20, 100], [100, 100]])
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit(1.42)

        //开启抗锯齿
        Circle()
          .width(150)
          .height(200)
          .fillOpacity(0)
          .strokeWidth(5)
          .stroke(Color.Black)
          .antiAlias(true)


        Circle()
          .width(150)
          .height(200)
          .fillOpacity(0)
          .strokeWidth(5)
          .stroke(Color.Black)
          .antiAlias(false)

        //绘制一个直径为150的圆
        Circle({ width: 150, height: 150 })
        //绘制一个直径为150、线条为红色虚线的圆环
        Circle()
          .width(150)
          .height(200)
          .fillOpacity(0)
          .strokeWidth(3)
          .stroke(Color.Red)
          .strokeDashArray([1, 2])
      }.width('100%')

    }.padding(12)
    .align(Alignment.TopStart)
    .height("100%")
    .backgroundColor(0xDCDCDC)
    .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Transparent) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring)
  }
}
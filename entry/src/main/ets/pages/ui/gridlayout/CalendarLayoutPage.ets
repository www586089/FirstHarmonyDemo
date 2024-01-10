
@Entry
@Component
struct CalendarLayoutPage {
  private scroller: Scroller = new Scroller()
  private headLabel: string[] = ['一', '二', '三', '四', '五', '六', '日']
  private curDate: Date;
  @State curDateStr: string = ''
  @State dateArray: number[] = []

  aboutToAppear() {
    let date = new Date();
    this.curDate = date;
    this.changeMonthData()
  }

  changeMonthData() {
    let monthLength = this.getMonthLength(this.curDate);
    this.dateArray = []
    for (let index = 0; index < monthLength; index++) {
      this.dateArray.push(index + 1)
    }
    this.curDateStr = `${this.curDate.getFullYear()}-${this.curDate.getMonth() + 1}`
  }

  private nextMonth() {
    this.curDate.setMonth(this.curDate.getMonth() + 1)
  }

  private prevMonth() {
    this.curDate.setMonth(this.curDate.getMonth() - 1)
  }

  private getMonthLength(date: Date): number {
    let copyDate = new Date(date.getFullYear(), date.getMonth() + 1, 0)
    return copyDate.getDate()
  }

  build() {
    Row() {

      Column() {
        Text(this.curDateStr)
          .backgroundColor(Color.Pink)
          .fontColor(Color.White)
          .height(48)
          .padding({ left: 24, right: 24 })
          .borderRadius(24)
        Row({ space: 8 }) {
          ForEach(this.headLabel, (item) => {
            Text(item).fontSize(14).layoutWeight(1).textAlign(TextAlign.Center).height('40%').borderRadius(26).backgroundColor('#67c8ff')
          }, item => JSON.stringify(item))
        }.height(52).backgroundColor('#999').margin({top: 24})

        Grid() {
          ForEach(this.dateArray, (item) => {
            GridItem() {
              Button(item + "")
                .width(52)
                .height(52)
                .borderWidth(1)
                .borderColor('#67c8ff')
            }
          }, item => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .margin({ top: 12 })
        .height('40%')

        Row({ space: 20 }) {
          Button('上一页')
            .onClick(() => {
              this.prevMonth()
              this.changeMonthData()
              // this.scroller.scrollPage({
              //   next: false
              // })
            })

          Button('下一页')
            .onClick(() => {
              this.nextMonth()
              this.changeMonthData()
              // this.scroller.scrollPage({
              //   next: true
              // })
            })
        }
      }
      .width('100%').backgroundColor('#eee').borderRadius(24)
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
    .margin({top: 48, left: 12, right: 12})
  }
}
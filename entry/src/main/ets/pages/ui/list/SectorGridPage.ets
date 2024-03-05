import router from '@ohos.router'

@Entry
@Component
struct SectorGridPage {
  @State message: string = 'Hello World'

  @State sectorItemArray: Record<string, string|object[]>[] = [
    {
      'title': '热门行业',
      'items': [
        { "itemTitle": '通讯', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯1', "totalChange": '1.48%', "itemLimit": '南宁百货', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯2', "totalChange": '1.48%', "itemLimit": '汇通新村', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯3', "totalChange": '1.48%', "itemLimit": '社会服务', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '建筑材料', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯4', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
      ] as Record<string, string>[]
    },
    {
      'title': '热门地区',
      'items': [
        { "itemTitle": '通讯', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22' },
        { "itemTitle": '通讯1', "totalChange": '1.48%', "itemLimit": '南宁百货', "itemChange": '6.1%', "itemAmtChange": '55.22' },
        { "itemTitle": '通讯2', "totalChange": '1.48%', "itemLimit": '汇通新村', "itemChange": '6.1%', "itemAmtChange": '55.22' },
        { "itemTitle": '通讯3', "totalChange": '1.48%', "itemLimit": '社会服务', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '建筑材料', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯4', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
      ] as Record<string, string>[]
    },
    {
      'title': '热门概念',
      'items': [
        { "itemTitle": '通讯', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯1', "totalChange": '1.48%', "itemLimit": '南宁百货', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯2', "totalChange": '1.48%', "itemLimit": '汇通新村', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯3', "totalChange": '1.48%', "itemLimit": '社会服务', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '建筑材料', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
        { "itemTitle": '通讯4', "totalChange": '1.48%', "itemLimit": '精伦电子', "itemChange": '6.1%', "itemAmtChange": '55.22'  },
      ] as Record<string, string>[]
    },
  ] as Record<string, string|object[]>[]

  @Builder itemHead(text: string) {
    RelativeContainer() {
      Text(text)
        // 添加其他属性
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        }).width('20%').height(48).margin({left: 16})
        .id("row1").backgroundColor("#ff0000")

      Image($r('app.media.icon_button_more'))
        .alignRules({
          right: { anchor: '__container__', align: HorizontalAlign.End },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        }).width(24).height(24).margin({right: 16}).onClick(() => {
        console.log("itemHead ---> " + text)
        router.pushUrl({ url: 'pages/list/ToDoListPage' })
      })
        .id("row2").backgroundColor("#ffcc00").objectFit(ImageFit.Contain)
    }.width('100%').height(48).backgroundColor("#67c8ff")
  }

  build() {
    Row() {
      Column() {
        Text().width('100%').height(580).backgroundColor("8067c8ff")
        List() {
          ForEach(this.sectorItemArray, (sectorItem: Record<string, string|object[]>, index) => {
            ListItemGroup({header: this.itemHead(sectorItem.title as string)}) {
              ListItem() {
                GridRow({columns: 3, gutter: 2}) {
                  ForEach(sectorItem.items as Record<string, string>[], (item: Record<string, string>, index) => {
                    GridCol() {
                      Column() {
                        Text(item.itemTitle as string).fontColor("#000000").fontSize(16).height(22).margin({top: 12})
                        Text(item.totalChange as string).fontColor("#E03136").fontSize(20).height(22).margin({top: 1})
                        Text(item.itemLimit as string).fontColor("#666666").fontSize(14).height(22).margin({top: 4})
                        Text(`${item.itemAmtChange} ${item.itemChange}`).fontColor("#E03136").fontSize(14).height(20)
                      }.backgroundColor(Color.Pink).width('100%').height('100%').onClick(() => {
                        console.log( `click ===> ${item.itemTitle}`);
                        router.pushUrl({ url: 'pages/list/ToDoListPage' })
                      })
                    }.width('30%').height(116)
                  }, (item: Record<string, string>) => JSON.stringify(item))
                }
              }
            }
          }, (sectorItem: Record<string, string|object[]>) => sectorItem.title as string)
        }.width('100%').height(0).layoutWeight(1)

      }.backgroundColor(Color.White)
      .width('100%')
    }
    .height('100%')
  }
}
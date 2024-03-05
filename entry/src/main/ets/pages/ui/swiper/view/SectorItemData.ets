import ArrayList from '@ohos.util.ArrayList';

export
class  SectorItemData {
  public constructor(area: string, topItem: string, change: string) {
    this.area = area;
    this.topItem = topItem;
    this.change = change;
  }
  public area: string
  public topItem: string
  public change: string
}

export
class SectorBean {
  public items: ArrayList<SectorItemData> = new ArrayList()
}

export
function getTestData(): SectorBean {
  let bean: SectorBean = new SectorBean()
  bean.items = new ArrayList()
  bean.items.add(new SectorItemData('基础设施', 'CS物流', '+1.28%'))
  bean.items.add(new SectorItemData('医药生物', '300医药', '+0.8%'))
  bean.items.add(new SectorItemData('新能源', '广汽集团', '+5.38%'))
  bean.items.add(new SectorItemData('奢侈品', '贵州茅台', '+3.25%'))
  return bean
}
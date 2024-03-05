import util from '@ohos.util';

class Contact {
  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;

  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}

@Entry
@Component
struct SimpleContacts {
  private contacts = [
    new Contact('小明1', $r("app.media.logo_quick_contacts")),
    new Contact('小红1', $r("app.media.logo_quick_contacts_dialer")),
    new Contact('小明2', $r("app.media.logo_quick_contacts")),
    new Contact('小红2', $r("app.media.logo_quick_contacts_dialer")),
  ]

  build() {
    List() {
      ForEach(this.contacts, (item: Contact) => {
        ListItem() {
          Row() {
            Image(item.icon)
              .width(40)
              .height(40)
              .margin(10)
            Text(item.name).fontSize(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
        }
      }, (item: Contact) => item.key)
    }
    .width('100%').height('100%')
  }
}
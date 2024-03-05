import util from '@ohos.util'

@Entry
@Component
struct ContactsListMore {
  @State message: string = 'Hello World'
  scroller: Scroller = new Scroller()


  build() {
    Row() {
      Stack() {
        Column() {
          ContactsView({})
        }

      }

      .width('100%')
    }
    .height('100%')
  }
}
class Contact {
  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;

  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}

class ContactItem {
  title: string
  contacts: Contact[]

  constructor(title: string, contact: Contact[]) {
    this.title = title
    this.contacts = contact
  }
}

const alphabets = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
  'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
@Component
struct ContactsView {

  contactsGroups = [
    {
      'title': 'A',
      'contacts': [
        new Contact('艾佳A', $r("app.media.logo_quick_contacts")),
        new Contact('安安A', $r("app.media.logo_quick_contacts")),
        new Contact('Angela', $r("app.media.logo_quick_contacts")),
      ] as Contact[]
    },
    {
      'title': 'B',
      'contacts': [
        new Contact('白叶B', $r("app.media.logo_quick_contacts_dialer")),
        new Contact('伯明B', $r("app.media.logo_quick_contacts_dialer")),
      ] as Contact[]
    },
    {
      'title': 'C',
      'contacts': [
        new Contact('艾佳C', $r("app.media.logo_quick_contacts")),
        new Contact('安安C', $r("app.media.logo_quick_contacts")),
        new Contact('Angela', $r("app.media.logo_quick_contacts")),
      ] as Contact[]
    },
    {
      'title': 'D',
      'contacts': [
        new Contact('白叶D', $r("app.media.logo_quick_contacts_dialer")),
        new Contact('伯明D', $r("app.media.logo_quick_contacts_dialer")),
      ] as Contact[]
    },
    {
      'title': 'E',
      'contacts': [
        new Contact('艾佳E', $r("app.media.logo_quick_contacts")),
        new Contact('安安E', $r("app.media.logo_quick_contacts")),
        new Contact('Angela', $r("app.media.logo_quick_contacts")),
      ] as Contact[]
    },
    {
      'title': 'F',
      'contacts': [
        new Contact('白叶F', $r("app.media.logo_quick_contacts_dialer")),
        new Contact('伯明F', $r("app.media.logo_quick_contacts_dialer")),
      ] as Contact[]
    },
    {
      'title': 'G',
      'contacts': [
        new Contact('艾佳G', $r("app.media.logo_quick_contacts")),
        new Contact('安安G', $r("app.media.logo_quick_contacts")),
        new Contact('Angela', $r("app.media.logo_quick_contacts")),
      ] as Contact[]
    },
    {
      'title': 'H',
      'contacts': [
        new Contact('白叶H', $r("app.media.logo_quick_contacts_dialer")),
        new Contact('伯明H', $r("app.media.logo_quick_contacts_dialer")),
      ] as Contact[]
    },
    {
      'title': 'I',
      'contacts': [
        new Contact('艾佳I', $r("app.media.logo_quick_contacts")),
        new Contact('安安I', $r("app.media.logo_quick_contacts")),
        new Contact('Angela', $r("app.media.logo_quick_contacts")),
      ] as Contact[]
    },
    {
      'title': 'J',
      'contacts': [
        new Contact('白叶J', $r("app.media.logo_quick_contacts_dialer")),
        new Contact('伯明J', $r("app.media.logo_quick_contacts_dialer")),
      ] as Contact[]
    },
    {
      'title': 'K',
      'contacts': [
        new Contact('艾佳K', $r("app.media.logo_quick_contacts")),
        new Contact('安安K', $r("app.media.logo_quick_contacts")),
        new Contact('Angela', $r("app.media.logo_quick_contacts")),
      ] as Contact[]
    },
    {
      'title': 'L',
      'contacts': [
        new Contact('白叶L', $r("app.media.logo_quick_contacts_dialer")),
        new Contact('伯明L', $r("app.media.logo_quick_contacts_dialer")),
      ] as Contact[]
    },
    {
      'title': 'Y',
      'contacts': [
        new Contact('艾佳Y', $r("app.media.logo_quick_contacts")),
        new Contact('安安Y', $r("app.media.logo_quick_contacts")),
        new Contact('Angela', $r("app.media.logo_quick_contacts")),
      ] as Contact[]
    },
    {
      'title': 'Z',
      'contacts': [
        new Contact('白叶Z', $r("app.media.logo_quick_contacts_dialer")),
        new Contact('伯明Z', $r("app.media.logo_quick_contacts_dialer")),
      ] as Contact[]
    },
  ] as Record<string, Contact[]|string>[]

  @Builder itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }
  private listScroller: Scroller = new Scroller();
  @State selectedIndex: number = 1;

  build() {
    Stack({alignContent: Alignment.BottomEnd}) {
      List({scroller: this.listScroller}) {
        ForEach(this.contactsGroups, (item: Record<string, Contact[]|string>) => {
          ListItemGroup({header: this.itemHead(item['title'] as string)}) {
            ForEach(item.contacts as Contact[], (contact: Contact) => {
              ListItem() {
                Row() {
                  Image(contact.icon)
                    .width(40)
                    .height(40)
                    .margin(10)
                  Text(contact.name).fontSize(20)
                }
                .width('100%')
                .justifyContent(FlexAlign.Start)
              }
            }, (item: Record<string, Contact[]|string>) => item.key as string)
          }
        })
      }
      .onScrollIndex((firstIndex: number) => {
        this.selectedIndex = firstIndex + 1
        console.debug(`index = ${firstIndex + 1}`)
        // 根据列表滚动到的索引值，重新计算对应联系人索引栏的位置this.selectedIndex
      })
      .sticky(StickyStyle.Footer).width('100%').height('100%')

      // 字母表索引组件
      AlphabetIndexer({ arrayValue: alphabets, selected: 0 })
        .selected(this.selectedIndex).width('auto').height('100%')
      Button("GoTop").width(80).height(44).backgroundColor("#67c8ff").onClick(() => {
        this.listScroller.scrollToIndex(0)
      })
    }.width('100%').height('100%')
  }
}
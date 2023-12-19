import util from '@ohos.util';

@Entry
@Component
struct ToDoListPage {
  @State toDoData: ToDo[] = [];
  private availableThings: string[] = ['读书', '运动', '旅游', '听音乐', '看电影', '唱歌'];


  build() {
    Stack({alignContent: Alignment.TopEnd}) {
      List({ space: 10 }) {
        ForEach(this.toDoData, (toDoItem) => {
          ListItem() {
          }
        }, toDoItem => toDoItem.key)
      }.width("100%").height("100%")
      Text('+')
        .onClick(() => {
          TextPickerDialog.show({
            range: this.availableThings,
            onAccept: (value: TextPickerResult) => {
              this.toDoData.push(new ToDo(this.availableThings[value.index])); // 新增列表项数据toDoData
            },
          })
        }).width(56).height(56)
    }
  }
}

export class ToDo {
  key: string = util.generateRandomUUID(true);
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}
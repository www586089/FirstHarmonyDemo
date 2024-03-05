import { ToDoItem } from '../model/ToDoItem'

@Preview
@Component
export struct ToDoListView {

  @State
  private toDoListItem: ToDoItem[] = []

  @Builder
  todoListItem(item: ToDoItem) {
    Row() {
      Checkbox().select(item.isSelected).onChange((select) => {
        item.isSelected = select
      })
      Text(item.text)
        .fontColor(item.isSelected ? "#888" : "#333")
        .decoration({type: item.isSelected ? TextDecorationType.LineThrough : TextDecorationType.None})
        .fontSize(22)
        .margin({left: 8})
    }
    .backgroundColor(Color.Pink)
    .height(48)
    .width('80%')
    .borderRadius(24)
    .onClick(() => {
      item.isSelected = !item.isSelected
    })
  }

  build() {
    Column({space: 8}) {
      Text('春晓').fontSize(40).fontColor('#333')
      ForEach(this.toDoListItem, (item: ToDoItem, index) => {
        this.todoListItem(item)
      }, (item: ToDoItem) => JSON.stringify(item))
    }
    .width('100%')
    .backgroundColor("#8067c8ff")
    .padding({top: 24, bottom: 24})
    .borderRadius(24)
  }
}
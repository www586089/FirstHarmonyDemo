import { ToDoItem } from './model/ToDoItem'
import { ToDoListView } from './view/ToDoListView'

@Entry
@Component
struct ToDoListDemoPage {
  @State message: string = 'Hello World'

  private infoArray: ToDoItem[] = [
    new ToDoItem(true, '春眠不觉晓'), new ToDoItem(false, '处处闻笛鸟'),
    new ToDoItem(false, '夜来风雨声'), new ToDoItem(false, '花落知多少')
  ]

  build() {
    Row() {
      ToDoListView({toDoListItem: this.infoArray})
    }
    .height('100%')
  }
}
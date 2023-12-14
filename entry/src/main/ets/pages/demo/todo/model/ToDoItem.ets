
export class ToDoItem {
  public isSelected: boolean;
  public text: string;
  public constructor(flag: boolean, text: string) {
    this.isSelected = flag;
    this.text = text;
  }

}
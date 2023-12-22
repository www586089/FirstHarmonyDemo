@Observed
export class Article {

  public id: string;
  public title: string;
  public brief: string;
  public isLiked: boolean = false;
  public likesCount: number = 100;

  constructor(id: string, title: string, brief: string) {
    this.id = id;
    this.title = title;
    this.brief = brief;
  }
}
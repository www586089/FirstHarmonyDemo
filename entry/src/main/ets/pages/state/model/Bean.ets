
export class ClassA {
  public subtitle: string;

  constructor(value: string) {
    this.subtitle = value;
  }
}

export class Model {
  public key: string;
  public value: ClassA;
  constructor(key: string, value: ClassA) {
    this.key = key;
    this.value = value;
  }
}
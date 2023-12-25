@Observed
export class StringData {
  message: string;
  imgSrc: Resource;
  constructor(message: string, imgSrc: Resource) {
    this.message = message;
    this.imgSrc = imgSrc;
  }
}

@Observed
export class StringDataV2 {
  message: NestedString;
  constructor(message: NestedString) {
    this.message = message;
  }
}

@Observed
export class NestedString {
  message: string;
  constructor(message: string) {
    this.message = message;
  }
}
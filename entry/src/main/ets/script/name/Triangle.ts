/// <reference path = "IShape.ts" />
import shape = require("./IShape");

// namespace Drawing {
  export class Triangle implements shape.IShape {
    public draw() {
      console.log("Triangle is drawn (external module)");
    }
  }
// }
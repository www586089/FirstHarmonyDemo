/// <reference path = "IShape.ts" />
import shape = require("./IShape");

// namespace Drawing {
  // export class Circle implements IShape {
  //   public draw() {
  //     console.log("Circle is drawn");
  //   }
  // }
  export class Circle implements shape.IShape {
    public draw() {
      console.log("Cirlce is drawn (external module)");
    }
  }
// }
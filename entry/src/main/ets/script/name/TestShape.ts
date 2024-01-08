/// <reference path = "IShape.ts" />
/// <reference path = "Circle.ts" />
/// <reference path = "Triangle.ts" />

import shape = require("./IShape");
import circle = require("./Circle");
import triangle = require("./Triangle");

function drawAllShapes(shape:shape.IShape) {
  shape.draw();
}
drawAllShapes(new circle.Circle());
drawAllShapes(new triangle.Triangle());
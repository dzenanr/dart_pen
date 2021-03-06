import 'dart:html';
import 'dart:async';
import 'dart:math';

import 'package:dart_pen/dart_pen.dart';

// See the style guide: http://www.dartlang.org/articles/style-guide/ .

// See the basics canvas tutorial:
// http://dev.opera.com/articles/view/html-5-canvas-the-basics/ .
// See the canvas painting tutorial:
// http://dev.opera.com/articles/view/html5-canvas-painting/ .
// Some turtle programs:
// http://www.sonic.net/~nbs/webturtle/examples/

// For debugging use print() and CTRL+SHIFT+J to open the console in Chrome.

final int lineWidth = 1;
final String lineColor = '#000000'; // black
// The board is redrawn every interval ms.
const int interval = 8;

var canvas;
var context;
var input;
var commands;
var data;
var pen;

clear() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  border();
}

border() {
  context.beginPath();
  context.rect(0, 0, canvas.width, canvas.height);
  context.lineWidth = lineWidth;
  context.strokeStyle = lineColor;
  context.closePath();
  context.stroke();
}

draw() {
  clear();
  for (Segment segment in pen.path.segments) {
    if (segment.drawn) {
      // draw segment lines
      context.beginPath();
      context.lineWidth = segment.width;
      context.strokeStyle = colors[segment.color];
      for (var i = 0; i < segment.lineCount; i++) {
        Line line = segment.lines[i];
        context.moveTo(line.beginPoint.x, line.beginPoint.y);
        context.lineTo(line.endPoint.x, line.endPoint.y);
        var x = (line.beginPoint.x + line.endPoint.x) / 2;
        var y = (line.beginPoint.y + line.endPoint.y) / 2;
        context.font = '14px sans-serif';
        context.textAlign = 'center';
        context.strokeText(segment.text, x + 2, y - 2, line.pixels);
      }
      context.stroke();
      context.closePath();
    }
  }
  // draw pen as a circle
  if (pen.visible) {
    Line lastLine = pen.path.lastLine();
    context.beginPath();
    context.lineWidth = lineWidth;
    context.strokeStyle = colors[pen.color];
    context.fillStyle = colors[pen.color];
    context.arc(
      lastLine.endPoint.x, lastLine.endPoint.y, pen.width + 1, 0, PI * 2, false);
    // draw the current direction
    Line direction = new Line.next(lastLine);
    direction.endPoint = direction.findEndPoint(
      direction.beginPoint, lastLine.cumulativeAngle, pen.width + 8);
    context.moveTo(direction.beginPoint.x, direction.beginPoint.y);
    context.lineTo(direction.endPoint.x, direction.endPoint.y);
    context.fill();
    context.stroke();
    context.closePath();
  }
}

main() {
  Point center() {
    var x = canvas.width / 2;
    var y = canvas.height / 2;
    return new Point(x, y);
  }
  
  colorMap();
  canvas = document.querySelector('#canvas');
  context = canvas.getContext('2d');
  pen = new Pen(center());
  input = new Input(pen);
  commands = new Commands(pen);
  data = new Data(pen);
  // Redraw every interval ms.
  new Timer.periodic(const Duration(milliseconds: interval), (t) => draw());
}

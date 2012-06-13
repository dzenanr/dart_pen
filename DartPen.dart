#import('dart:html');
#source('model/Pen.dart');
#source('model/Path.dart');
#source('model/Segment.dart');
#source('model/Line.dart');
#source('view/Input.dart');
#source('view/Output.dart');

// See the style guide: http://www.dartlang.org/articles/style-guide/ .

// See the basics canvas tutorial: http://dev.opera.com/articles/view/html-5-canvas-the-basics/ .
// See the canvas painting tutorial: http://dev.opera.com/articles/view/html5-canvas-painting/ .

// For debugging use print() and CTRL+SHIFT+J to open the console in Chrome.

final int DEFAULT_LINE_WIDTH = 1;
final String DEFAULT_LINE_COLOR = '#000000'; // black
// The board is redrawn every INTERVAL ms.
final int INTERVAL = 8;

var canvas;
var context;
var input;
var output;
var pen;

Point center() {
  var x = canvas.width / 2;
  var y = canvas.height / 2;
  return new Point(x, y);
}

clear() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  border();
}

border() {
  context.beginPath();
  context.rect(0, 0, canvas.width, canvas.height);
  context.lineWidth = DEFAULT_LINE_WIDTH;
  context.strokeStyle = DEFAULT_LINE_COLOR;
  context.stroke();
  context.closePath();
}

draw() {
  clear();
  for (Segment segment in pen.path.segments) {
    if (segment.draw) {
      context.beginPath();
      context.lineWidth = DEFAULT_LINE_WIDTH;
      context.strokeStyle = segment.colorCode;
      // draw line
      for (var i = 0; i < segment.lineCount; i++) {
        Line line = segment.lines[i];
        context.moveTo(line.beginPoint.x, line.beginPoint.y);
        context.lineTo(line.endPoint.x, line.endPoint.y);
      }
      context.stroke();
      context.closePath();
    }
  }
  Segment lastSegment = pen.path.segments.last();
  Line lastLine = lastSegment.lines.last();
  // draw pen
  context.beginPath();
  context.lineWidth = DEFAULT_LINE_WIDTH;
  context.strokeStyle = pen.colorCode;
  context.fillStyle = pen.colorCode;
  int s = Pen.SIZE;
  context.rect(lastLine.endPoint.x - s/2, lastLine.endPoint.y - s/2, s, s);
  context.fill();
  context.stroke();
  context.closePath();
}

main() {
  canvas = document.query('#canvas');
  context = canvas.getContext('2d');
  pen = new Pen(center());
  input = new Input(pen);
  output = new Output(pen);

  // Redraw every INTERVAL ms.
  document.window.setInterval(draw, INTERVAL);
}

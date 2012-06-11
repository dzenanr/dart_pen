class Input {

  static final int DEFAULT_ROTATE = 45;
  static final int DEFAULT_ADVANCE = 45;
  static final int DEFAULT_ITERATE = 24;

  final Pen pen;

  InputElement rotateInput;
  InputElement advanceInput;
  InputElement iterateInput;
  ButtonElement doButton;

  Input(this.pen) {
    rotateInput = document.query('#rotate');
    advanceInput = document.query('#advance');
    iterateInput = document.query('#iterate');
    rotateInput.value = DEFAULT_ROTATE;
    advanceInput.value = DEFAULT_ADVANCE;
    iterateInput.value = DEFAULT_ITERATE;
    doButton = document.query('#do');
    doButton.on.click.add((MouseEvent e) {
      var lastLine = pen.path.segments.last().lines.last();
      int lineCount = Math.parseInt(iterateInput.value);
      var segment = new Segment(lineCount);
      pen.path.segments.add(segment);
      for (var i = 0; i < segment.lineCount; i++) {
        var line = new Line(lastLine.endPoint);
        segment.lines[i] = line;
        line.angle = lastLine.angle + Math.parseInt(rotateInput.value);
        line.pixels = Math.parseInt(advanceInput.value);
        lastLine = line;
      }
    });
  }

}

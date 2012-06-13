class Input {

  static final String DEFAULT_TURN = '45';
  static final String DEFAULT_ADVANCE = '80';
  static final String DEFAULT_REPEAT = '0';

  final Pen pen;

  InputElement downCheckbox;
  SelectElement colorSelect;

  InputElement turnInput;
  InputElement advanceInput;
  InputElement repeatInput;
  ButtonElement doButton;
  ButtonElement centerButton;

  Input(this.pen) {
    turnInput = document.query('#turn');
    advanceInput = document.query('#advance');
    repeatInput = document.query('#repeat');
    turnInput.value = DEFAULT_TURN;
    advanceInput.value = DEFAULT_ADVANCE;
    repeatInput.value = DEFAULT_REPEAT;

    downCheckbox = document.query('#down');
    downCheckbox.checked = pen.down;
    downCheckbox.on.change.add((Event e) {
      pen.down = downCheckbox.checked;
    });

    colorSelect = document.query('#color');
    colorSelect.on.change.add((Event e) {
      pen.colorName = colorSelect.value;
    });

    doButton = document.query('#do');
    doButton.on.click.add((MouseEvent e) {
      try {
        var lastLine = pen.path.segments.last().lines.last();
        int lineCount = Math.parseInt(repeatInput.value) + 1;
        if (lineCount > 0) {
          var segment = new Segment(lineCount);
          segment.draw = pen.down;
          segment.colorCode = pen.colorCode;
          pen.path.segments.add(segment);
          for (var i = 0; i < segment.lineCount; i++) {
            var line = new Line.next(lastLine);
            segment.lines[i] = line;
            line.angle = Math.parseInt(turnInput.value);
            line.pixels = Math.parseInt(advanceInput.value);
            lastLine = line;
          }
        }
      } catch(final error) {
        print('Error in input! -- $error');
      }
    });

    centerButton = document.query('#center');
    centerButton.on.click.add((MouseEvent e) {
      try {
        var lastLine = pen.path.segments.last().lines.last();
        var segment = new Segment(1);
        segment.draw = pen.down;
        segment.colorCode = pen.colorCode;
        pen.path.segments.add(segment);
        var line = new Line.next(lastLine);
        segment.lines[0] = line;
        line.endPoint = center();
      } catch(final error) {
        print('Error in input! -- $error');
      }
    });

  }

}

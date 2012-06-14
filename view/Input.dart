class Input {

  static final String DEFAULT_TURN = '45';
  static final String DEFAULT_GO = '80';
  static final String DEFAULT_REPEAT = '0';

  final Pen pen;

  InputElement downCheckbox;
  SelectElement colorSelect;
  SelectElement widthSelect;

  InputElement turnInput;
  InputElement goInput;
  InputElement repeatInput;
  ButtonElement doButton;
  ButtonElement centerButton;

  Input(this.pen) {
    downCheckbox = document.query('#down');
    downCheckbox.checked = pen.down;
    downCheckbox.on.change.add((Event e) {
      pen.down = downCheckbox.checked;
    });

    colorSelect = document.query('#color');
    colorSelect.on.change.add((Event e) {
      pen.color = colorSelect.value;
    });

    widthSelect = document.query('#width');
    widthSelect.on.change.add((Event e) {
      try {
        pen.width = Math.parseInt(widthSelect.value);
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
        segment.color = pen.color;
        segment.width = pen.width;
        pen.path.segments.add(segment);
        var line = new Line.next(lastLine);
        segment.lines[0] = line;
        line.endPoint = center();
      } catch(final error) {
        print('Error in input! -- $error');
      }
    });

    turnInput = document.query('#turn');
    turnInput.value = DEFAULT_TURN;

    goInput = document.query('#go');
    goInput.value = DEFAULT_GO;

    repeatInput = document.query('#repeat');
    repeatInput.value = DEFAULT_REPEAT;

    doButton = document.query('#do');
    doButton.on.click.add((MouseEvent e) {
      try {
        var lastLine = pen.path.segments.last().lines.last();
        int lineCount = Math.parseInt(repeatInput.value) + 1;
        if (lineCount > 0) {
          var segment = new Segment(lineCount);
          segment.draw = pen.down;
          segment.color = pen.color;
          segment.width = pen.width;
          pen.path.segments.add(segment);
          for (var i = 0; i < segment.lineCount; i++) {
            var line = new Line.next(lastLine);
            segment.lines[i] = line;
            line.angle = Math.parseInt(turnInput.value);
            line.pixels = Math.parseInt(goInput.value);
            lastLine = line;
          }
        }
      } catch(final error) {
        print('Error in input! -- $error');
      }
    });
  }

}

part of dart_pen;

class Input {

  static final bool DEFAULT_DOWN = true;
  static final String DEFAULT_COLOR = 'black';
  static final String DEFAULT_WIDTH = '1';
  static final String DEFAULT_WRITE = '';
  static final bool DEFAULT_VISIBLE = true;

  static final String DEFAULT_TURN = '0';
  static final String DEFAULT_ADVANCE = '80';
  static final String DEFAULT_REPEAT = '0';

  final Pen pen;

  InputElement downCheckbox;
  SelectElement colorSelect;
  SelectElement widthSelect;
  InputElement writeInput;
  InputElement visibleCheckbox;
  ButtonElement centerButton;
  SelectElement demosSelect;

  InputElement turnInput;
  InputElement advanceInput;
  InputElement repeatInput;
  ButtonElement moveButton;
  ButtonElement randomButton;
  ButtonElement allButton;
  ButtonElement eraseButton;

  Input(this.pen) {
    downCheckbox = document.query('#down');
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
        pen.width = int.parse(widthSelect.value);
      } catch(error) {
        print('Error in input! -- $error');
      }
    });

    writeInput = document.query('#write');
    writeInput.on.change.add((Event e) {
      pen.write = writeInput.value;
    });

    visibleCheckbox = document.query('#visible');
    visibleCheckbox.on.change.add((Event e) {
      pen.visible = visibleCheckbox.checked;
    });

    centerButton = document.query('#center');
    centerButton.on.click.add((MouseEvent e) {
      pen.moveTo(center());
    });

    demosSelect = document.query('#demos');
    demosSelect.on.change.add((Event e) {
      try {
        if (demosSelect.value == 'demos' || demosSelect.value == 'random') {
          randomDemo(pen);
        } else {
          int d = int.parse(demosSelect.value);
          demo(pen, d);
        }
      } on FormatException catch(error) {
        randomDemo(pen);
      }
    });

    turnInput = document.query('#turn');
    advanceInput = document.query('#advance');
    repeatInput = document.query('#repeat');
    moveButton = document.query('#move');
    moveButton.on.click.add((MouseEvent e) {
      try {
        num turn = double.parse(turnInput.value);
        num advance = double.parse(advanceInput.value);
        int repeat = int.parse(repeatInput.value);
        pen.move(turn, advance, repeat);
      } on FormatException catch(error) {
        print('Error in input! -- $error');
      }
    });

    randomButton = document.query('#random');
    randomButton.on.click.add((MouseEvent e) {
      pen.randomMove();
    });

    allButton = document.query('#all');
    allButton.on.click.add((MouseEvent e) {
      pen.all();
    });

    eraseButton = document.query('#erase');
    eraseButton.on.click.add((MouseEvent e) {
      pen.erase();
      _init();
    });

    _init();
  }

  _init() {
    downCheckbox.checked = DEFAULT_DOWN;
    colorSelect.value = DEFAULT_COLOR;
    widthSelect.value = DEFAULT_WIDTH;
    writeInput.value = DEFAULT_WRITE;
    visibleCheckbox.checked = DEFAULT_VISIBLE;

    turnInput.value = DEFAULT_TURN;
    advanceInput.value = DEFAULT_ADVANCE;
    repeatInput.value = DEFAULT_REPEAT;
  }

}

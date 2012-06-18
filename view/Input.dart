class Input {

  static final String DEFAULT_TURN = '45';
  static final String DEFAULT_ADVANCE = '80';
  static final String DEFAULT_REPEAT = '0';

  final Pen pen;

  InputElement downCheckbox;
  SelectElement colorSelect;
  SelectElement widthSelect;
  ButtonElement centerButton;
  SelectElement demosSelect;
  ButtonElement demoButton;

  InputElement turnInput;
  InputElement advanceInput;
  InputElement repeatInput;
  ButtonElement moveButton;
  ButtonElement randomButton;
  ButtonElement allButton;
  ButtonElement eraseButton;

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
      pen.moveTo(center());
    });

    demosSelect = document.query('#demos');

    demoButton = document.query('#demo');
    demoButton.on.click.add((MouseEvent e) {
      try {
        var d = Math.parseInt(demosSelect.value);
        demo(pen, d);
      } catch(final error) {
        randomDemo(pen);
      }
    });

    turnInput = document.query('#turn');
    turnInput.value = DEFAULT_TURN;

    advanceInput = document.query('#advance');
    advanceInput.value = DEFAULT_ADVANCE;

    repeatInput = document.query('#repeat');
    repeatInput.value = DEFAULT_REPEAT;

    moveButton = document.query('#move');
    moveButton.on.click.add((MouseEvent e) {
      try {
        num turn = Math.parseDouble(turnInput.value);
        num advance = Math.parseDouble(advanceInput.value);
        int repeat = Math.parseInt(repeatInput.value);
        pen.move(turn, advance, repeat);
      } catch(final error) {
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
      downCheckbox.checked = true;
      colorSelect.value = 'black';
      widthSelect.value = '1';
    });
  }

}

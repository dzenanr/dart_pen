part of dart_pen;

class Data {

  final Pen pen;

  ButtonElement displayButton;
  ButtonElement clearButton;
  TextAreaElement pathTextArea;

  Data(this.pen) {
    displayButton = document.query('#display');
    displayButton.on.click.add((MouseEvent e) {
      clear();
      pathTextArea.value = pen.path.toString();
    });

    clearButton = document.query('#clear');
    clearButton.on.click.add((MouseEvent e) {
      clear();
    });

    pathTextArea = document.query('#path');
  }

  clear() => pathTextArea.value = '';

}

part of dart_pen;

class Data {

  final Pen pen;

  ButtonElement displayButton;
  ButtonElement clearButton;
  TextAreaElement pathTextArea;

  Data(this.pen) {
    displayButton = document.querySelector('#display');
    displayButton.onClick.listen((MouseEvent e) {
      clear();
      pathTextArea.value = pen.path.toString();
    });

    clearButton = document.querySelector('#clear');
    clearButton.onClick.listen((MouseEvent e) {
      clear();
    });

    pathTextArea = document.querySelector('#path');
  }

  clear() => pathTextArea.value = '';

}

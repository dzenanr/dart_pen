class Output {

  final Pen pen;

  TextAreaElement pathTextArea;
  ButtonElement displayButton;
  ButtonElement clearButton;

  Output(this.pen) {
    pathTextArea = document.query('#path');
    displayButton = document.query('#display');
    displayButton.on.click.add((MouseEvent e) {
      clear();
      pathTextArea.value = pen.path.toString();
    });
    clearButton = document.query('#clear');
    clearButton.on.click.add((MouseEvent e) {
      clear();
    });
  }

  clear() {
    pathTextArea.value = '';
  }

}

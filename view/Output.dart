class Output {

  final Pen pen;

  TextAreaElement pathTextArea;
  ButtonElement displayButton;

  Output(this.pen) {
    pathTextArea = document.query('#path');
    displayButton = document.query('#display');
    displayButton.on.click.add((MouseEvent e) {
      clear();
      pathTextArea.value = pen.path.toString();
    });
  }

  clear() {
    pathTextArea.value = '';
  }

}

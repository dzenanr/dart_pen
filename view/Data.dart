class Data {

  final Pen pen;

  ButtonElement displayButton;
  TextAreaElement pathTextArea;

  Data(this.pen) {
    displayButton = document.query('#display');
    displayButton.on.click.add((MouseEvent e) {
      clear();
      pathTextArea.value = pen.path.toString();
    });

    pathTextArea = document.query('#path');
  }

  clear() => pathTextArea.value = '';

}

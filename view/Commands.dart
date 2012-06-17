class Commands {

  final Pen pen;

  ButtonElement showButton;
  ButtonElement clearButton;
  ButtonElement drawButton;
  TextAreaElement commandsTextArea;

  Commands(this.pen) {
    showButton = document.query('#show');
    showButton.on.click.add((MouseEvent e) {
      clear();
      commandsTextArea.value = pen.fromCommands();
    });

    clearButton = document.query('#clear');
    clearButton.on.click.add((MouseEvent e) {
      clear();
    });

    drawButton = document.query('#draw');
    drawButton.on.click.add((MouseEvent e) {
      pen.erase();
      pen.toCommands(commandsTextArea.value);
      pen.interpret();
    });

    commandsTextArea = document.query('#commands');
  }

  clear() => commandsTextArea.value = '';
}

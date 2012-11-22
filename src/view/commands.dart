part of dart_pen;

class Commands {

  final Pen pen;

  ButtonElement showButton;
  ButtonElement hideButton;
  ButtonElement drawButton;
  TextAreaElement commandsTextArea;

  Commands(this.pen) {
    showButton = document.query('#show');
    showButton.on.click.add((MouseEvent e) {
      clear();
      commandsTextArea.value = pen.fromCommands();
      commandsTextArea.select();
    });

    hideButton = document.query('#hide');
    hideButton.on.click.add((MouseEvent e) {
      clear();
    });

    drawButton = document.query('#draw');
    drawButton.on.click.add((MouseEvent e) {
      pen.erase();
      pen.interpret(commandsTextArea.value);
    });

    commandsTextArea = document.query('#commands');
  }

  clear() => commandsTextArea.value = '';
}

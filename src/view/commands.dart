part of dart_pen;

class Commands {

  final Pen pen;

  ButtonElement showButton;
  ButtonElement hideButton;
  ButtonElement drawButton;
  TextAreaElement commandsTextArea;

  Commands(this.pen) {
    showButton = document.querySelector('#show');
    showButton.onClick.listen((MouseEvent e) {
      clear();
      commandsTextArea.value = pen.fromCommands();
      commandsTextArea.select();
    });

    hideButton = document.querySelector('#hide');
    hideButton.onClick.listen((MouseEvent e) {
      clear();
    });

    drawButton = document.querySelector('#draw');
    drawButton.onClick.listen((MouseEvent e) {
      pen.erase();
      pen.interpret(commandsTextArea.value);
    });

    commandsTextArea = document.querySelector('#commands');
  }

  clear() => commandsTextArea.value = '';
}

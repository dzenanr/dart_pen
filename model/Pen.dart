class Pen {

  static final num MAX_TURN = 360;
  static final num MAX_ADVANCE = 160;
  static final int MAX_REPEAT = 16;
  static final int MAX_WIDTH = 6;

  Point start;

  bool _down;
  String _color;
  int _width;

  var path;
  var commands;

  Pen(this.start) {
    _init();
  }

  _init() {
    _down = true;
    _color = 'black';
    _width = 1;

    path = new Path();
    var startSegment = new Segment(1, draw:false);
    startSegment.lines[0] = new Line.first(start);
    path.segments.add(startSegment);

    commands = new List<List>();
  }

  erase() {
    _init();
  }

  void set down(bool down) {
    _down = down;
    commands.add(['down', down]);
  }

  bool get down() => _down;

  void set color(String color) {
    _color = color;
    commands.add(['color', color]);
  }

  String get color() => _color;

  void set width(int width) {
    _width = width;
    commands.add(['width', width]);
  }

  int get width() => _width;

  randomColor() => color = randomListElement(colorList);
  randomWidth() => width = randomInt(MAX_WIDTH);

  moveTo(Point point) {
    var lastLine = pen.path.lastLine();
    var segment = new Segment(1);
    segment.draw = pen.down;
    segment.color = pen.color;
    segment.width = pen.width;
    pen.path.segments.add(segment);
    var line = new Line.next(lastLine);
    segment.lines[0] = line;
    line.endPoint = point;

    commands.add(['moveTo', point.x, point.y]);
  }

  moveToStart() => moveTo(start);

  randomMoveTo() =>
      moveTo(randomPoint(randomSign() * start.x, randomSign() * start.y));

  move(num turn, [num advance = 0, int repeat = 0]) {
    var lastLine = path.lastLine();
    int lineCount = repeat + 1;
    if (lineCount > 0) {
      var segment = new Segment(lineCount);
      segment.draw = pen.down;
      segment.color = pen.color;
      segment.width = pen.width;
      path.segments.add(segment);
      for (var i = 0; i < segment.lineCount; i++) {
        var line = new Line.next(lastLine);
        segment.lines[i] = line;
        line.angle = turn;
        line.pixels = advance;
        lastLine = line;
      }
    }

    commands.add(['move', turn, advance, repeat]);
  }

  randomMove() =>
      move(randomSign() * randomNum(MAX_TURN),
        randomSign() * randomNum(MAX_ADVANCE), randomInt(MAX_REPEAT));

  all([int repeat = 1]) {
    for (var i = 0; i < repeat; i++) {
      path.double();
    }

    commands.add(['all', repeat]);
  }

  randomAll() {
    all(randomInt(MAX_REPEAT));
  }

  String fromCommands() {
    String result = '';
    for (var command in commands) {
      if (command.length > 0) {
        String commandLine = command[0];
        if (commandLine != '') {
          for (var i = 1; i < command.length; i++) {
            commandLine = '$commandLine, ${command[i]}';
          }
          commandLine = '$commandLine;\n';
          result = '$result $commandLine';
        }
      }
    }
    return result;
  }

  toCommands(String commandsString) {
    var singleLine = commandsString.replaceAll('\n', '');
    var commandsWoutSpaces = singleLine.trim().replaceAll(' ', '');
    List commandStrings = commandsWoutSpaces.split(';');
    for (String commandString in commandStrings) {
      List commandElements = commandString.split(',');
      commands.add(commandElements);
    }
  }

  interpret() {
    try {
      for (var command in commands) {
        if (command.length > 0) {
          switch(command[0]) {
            case 'down':
              String downString = command[1];
              if (downString == 'true') {
                down = true;
              } else if (downString == 'false') {
                down = false;
              }
              break;
            case 'color':
              String colorString = command[1];
              color = colorString;
              break;
            case 'randomColor':
              randomColor();
              break;
            case 'width':
              String widthString = command[1];
              width = Math.parseInt(widthString);
              break;
            case 'randomWidth':
              randomWidth();
              break;
            case 'moveTo':
              String xString = command[1];
              String yString = command[2];
              moveTo(new Point(Math.parseDouble(xString), Math.parseDouble(yString)));
              break;
            case 'randomMoveTo':
              randomMoveTo();
              break;
            case 'move':
              String turnString = command[1];
              String advanceString = command[2];
              String repeatString = command[3];
              move(Math.parseDouble(turnString), Math.parseDouble(advanceString), Math.parseInt(repeatString));
              break;
            case 'randomMove':
              randomMove();
              break;
            case 'all':
              String repeatString = command[1];
              all(Math.parseInt(repeatString));
              break;
            case 'randomAll':
              randomAll();
          }
        }
      }
    } catch(final error) {
      print('Error in interpretation of commands! -- $error');
    }
  }

}

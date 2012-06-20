class Pen {

  static final num MAX_TURN = 360;
  static final num MAX_ADVANCE = 160;
  static final int MAX_REPEAT = 10;
  static final int MAX_WIDTH = 5;

  Point start;

  bool _down;
  String _color;
  int _width;
  String _write;

  bool visible;

  var path;
  var commands;

  Pen(this.start) {
    _init();
  }

  _init() {
    _down = true;
    _color = 'black';
    _width = 1;
    _write = '';

    visible = true;

    path = new Path();
    var startSegment = new Segment(1, drawn:false);
    startSegment.lines[0] = new Line.first(start);
    path.segments.add(startSegment);

    commands = new List<List>();
  }

  erase() {
    _init();
  }

  void set down(bool down) {
    _down = down;
    commands.add(['down', _down]);
  }

  bool get down() => _down;
  bool isDown() => down;

  void set color(String color) {
    _color = color;
    commands.add(['color', _color]);
  }

  String get color() => _color;

  void set width(int width) {
    if (width == 0) {
      _width = 1;
    } else {
      _width = width;
    }
    commands.add(['width', _width]);
  }

  int get width() => _width;

  void set write(String write) {
    _write = write;
    commands.add(['write', _write]);
  }

  String get write() => _write;

  bool isVisible() => visible;

  randomColor() => color = randomListElement(colorList);
  randomWidth() => width = randomInt(MAX_WIDTH);

  moveTo(Point point) {
    var lastLine = path.lastLine();
    var segment = new Segment(1);
    segment.drawn = down;
    segment.color = color;
    segment.width = width;
    segment.text = write;
    path.segments.add(segment);
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
      segment.drawn = down;
      segment.color = color;
      segment.width = width;
      segment.text = write;
      path.segments.add(segment);
      for (var i = 0; i < segment.lineCount; i++) {
        var line = new Line.next(lastLine);
        segment.lines[i] = line;
        line.angle = turn;
        line.pixels = advance;
        lastLine = line;
      }
    }
    if (repeat == 0) {
      if (advance == 0) {
        commands.add(['move', turn]);
      } else {
        commands.add(['move', turn, advance]);
      }
    } else {
      commands.add(['move', turn, advance, repeat]);
    }
  }

  right (num angle) {
    if (angle > 0) {
      move(angle);
    }
  }

  left (num angle) {
    if (angle > 0) {
      move(-angle);
    }
  }

  forward(num steps) {
    if (steps > 0) {
      move(0, steps);
    }
  }

  backward(num steps) {
    if (steps > 0) {
      move(0, -steps);
    }
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
      if (command.length > 1) { // skip commands without params such as randomMove
        String commandLine = command[0];
        if (commandLine != '') {
          for (var i = 1; i < command.length; i++) {
            commandLine = '$commandLine, ${command[i]}';
          }
          commandLine = '$commandLine;\n';
          result = '$result$commandLine';
        }
      }
    }
    return result;
  }

  List<List> _toCommands(String commandsString) {
    var commandList = new List<List>();
    var singleLine = commandsString.replaceAll('\n', '');
    var commandsWoutSpaces = singleLine.trim().replaceAll(' ', '');
    List commandStrings = commandsWoutSpaces.split(';');
    for (String commandString in commandStrings) {
      List commandElements = commandString.split(',');
      commandList.add(commandElements);
    }
    return commandList;
  }

  interpret(String commandsString) {
    try {
      List<List> commandList = _toCommands(commandsString);
      for (var command in commandList) {
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
              color = command[1];
              break;
            case 'randomColor':
              randomColor();
              break;
            case 'width':
              width = Math.parseInt(command[1]);
              break;
            case 'randomWidth':
              randomWidth();
              break;
            case 'write':
              write = command[1];
              break;
            case 'moveTo':
              moveTo(new Point(
                Math.parseDouble(command[1]), Math.parseDouble(command[2])));
              break;
            case 'moveToStart':
              moveToStart();
              break;
            case 'randomMoveTo':
              randomMoveTo();
              break;
            case 'move':
              if (command.length == 2) {
                move(Math.parseDouble(command[1]));
              } else if (command.length == 3) {
                move(Math.parseDouble(command[1]), Math.parseDouble(command[2]));
              } else if (command.length == 4) {
                move(Math.parseDouble(command[1]), Math.parseDouble(command[2]),
                  Math.parseInt(command[3]));
              }
              break;
            case 'right':
              right(Math.parseDouble(command[1]));
              break;
            case 'left':
              left(Math.parseDouble(command[1]));
              break;
            case 'forward':
              forward(Math.parseDouble(command[1]));
              break;
            case 'backward':
              backward(Math.parseDouble(command[1]));
              break;
            case 'randomMove':
              randomMove();
              break;
            case 'all':
              all(Math.parseInt(command[1]));
              break;
            case 'randomAll':
              randomAll();
          } // switch
        } // if
      } // for
    } catch(final error) {
      print('Error in interpretation of commands! -- $error');
    }
  }

}

class Pen {

  Point start;

  bool down;
  String color;
  int width;

  var path;
  var commands;

  Pen(this.start) {
    _init();
  }

  _init() {
    down = true;
    color = 'black';
    width = 1;

    path = new Path();
    var startSegment = new Segment(1, draw:false);
    startSegment.lines[0] = new Line.first(start);
    path.segments.add(startSegment);

    commands = new List<List>();
  }

  erase() {
    _init();
  }

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
  }

  move(num turn, num advance, int repeat) {
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
  }

  all() {
    path.double();
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
        if (command.length > 1) {
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
            case 'width':
              String widthString = command[1];
              width = Math.parseInt(widthString);
              break;
            case 'moveTo':
              String xString = command[1];
              String yString = command[2];
              moveTo(new Point(Math.parseInt(xString), Math.parseInt(yString)));
              break;
            case 'move':
              String turnString = command[1];
              String advanceString = command[2];
              String repeatString = command[3];
              move(Math.parseInt(turnString), Math.parseInt(advanceString), Math.parseInt(repeatString));
              break;
            case 'all':
              String countString = command[1];
              for (var i = 0; i < Math.parseInt(countString); i++) {
                all();
              }
          }
        }
      }
    } catch(final error) {
      print('Error in command interpretation! -- $error');
    }
  }

}

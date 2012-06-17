demo(var p, int dn) {
  try {
    switch(dn) {
      case 1:
        p.erase();
        demo1(p);
        break;
      case 2:
        p.erase();
        demo2(p);
        break;
      case 3:
        p.erase();
        demo3(p);
        break;
      case 4:
        p.erase();
        demo4(p);
        break;
      case 5:
        p.erase();
        demo5(p);
        break;
      case 6:
        p.erase();
        demo6(p);
        break;
      case 7:
        p.erase();
        demo7(p);
        break;
      case 8:
        p.erase();
        demo8(p);
        break;
      case 9:
        p.erase();
        demo9(p);
        break;
      case 10:
        p.erase();
        demo10(p);
        break;
      default:
        p.erase();
        demo1(p);
    }
  } catch(final error) {
    print('Error in demo! -- $error');
  }
}

demo1(var p) {
  p.color = 'red';
  p.move(45, 80, 1);
  p.width = 2;
  p.color = 'yellow';
  p.move(50, 80, 1);
  p.width = 1;
  p.color = 'blue';
  p.move(65, 80, 1);
  p.all(4);
}

demo2(var p) {
  p.color = 'red';
  p.move(90, 100, 0);
  p.move(120, 100, 1);
  p.color = 'gray';
  p.move(60, 100, 0);
  p.move(120, 100, 1);
  p.color = 'blue';
  p.move(60, 100, 0);
  p.move(120, 100, 1);
  p.all(3);
}

demo3(var p) {
  p.color = 'red';
  p.move(33, 100, 0);
  p.move(120, 100, 1);
  p.color = 'gray';
  p.move(60, 100, 0);
  p.move(120, 100, 1);
  p.color = 'blue';
  p.move(60, 100, 0);
  p.move(120, 100, 1);
  p.all(6);
}

demo4(var p) {
  p.color = 'red';
  p.move(33, 100, 2);
  p.color = 'gray';
  p.move(120, 100, 6);
  p.color = 'orange';
  p.move(-60, 100, 4);
  p.color = 'yellow';
  p.move(100, 100, 3);
  p.color = 'blue';
  p.move(60, 100, 2);
  p.move(15, 100, 8);
  p.all(8);
}

demo5(var p) {
  var commandsString = 'color, red; move, 45, 80, 1; width, 3; color, yellow; move, 50, 80, 1; width, 2; color, blue; move, 65, 80, 1; down, false; moveTo, 333, 333; down, true; move, 15, 120, 4; all, 7';
  p.toCommands(commandsString);
  p.interpret();
}

demo6(var p) {
  var commandsString = '''
    color, red; width, 2; move, 15, 160, 2; 
    color, green; width, 1; move, -45, 200, 3; move, 66, 80, 6; 
    color, brown;  width, 2; move, -20, 40, 8; 
    all, 6;
''';
  p.toCommands(commandsString);
  p.interpret();
}

demo7(var p) {
  var commandsString = '''
    color, gray; 
    width, 2; 
    move, 45, 80, 1; 
    color, green; 
    width, 1; 
    move, 33, 80, 1; 
    color, orange;  
    width, 3; 
    move, 15, 80, 1; 
    move, 90, 80, 4; 
    all, 5;
  ''';
  p.toCommands(commandsString);
  p.interpret();
}

demo8(var p) {
  var commandsString =
    'color, yellow; '
    'width, 3; '
    'move, 80, 80, 3; '
    'color, gray; '
    'width, 1; '
    'move, -18, 60, 6; '
    'color, blue; '
    'width, 2; '
    'move, 120, 100, 5; '
    'move, 5, -80, 9; '
    'all, 4';
  p.toCommands(commandsString);
  p.interpret();
}

f1(var p, var length, var depth) {
  if (depth == 0) {
    p.move(0, length);
  } else {
    f1(p, length/3, depth-1);
    p.move(60);
    f1(p, length/3, depth-1);
    p.move(-120);
    f1(p, length/3, depth-1);
    p.move(60);
    f1(p, length/3, depth-1);
  }
}

demo9(var p) {
  f1(p, 320, 4);
}

f2(var p, var length, var depth) {
  if (depth == 0) {
    p.move(0, length);
  } else {
    f2(p, length/3, depth-1);
    p.move(60, length);
    f2(p, length/3, depth-1);
    p.move(120, length);
    f2(p, length/3, depth-1);
    p.move(60, length);
    f2(p, length/3, depth-1);
  }
}

demo10(var p) {
  f2(p, 240, 4);
}

randomDemo(var p) {
  var commandsString =
    'randomColor; '
    'randomWidth; '
    'randomMove; '
    'randomMove; '
    'randomColor; '
    'randomWidth; '
    'randomMove; '
    'down, false; '
    'moveToStart; '
    'down, true; '
    'randomColor; '
    'randomWidth; '
    'randomMove; '
    'moveToStart; '
    'randomMove; '
    'randomMove; '
    'randomAll';
  p.erase();
  p.toCommands(commandsString);
  p.interpret();
}





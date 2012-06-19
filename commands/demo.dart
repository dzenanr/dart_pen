demo(var p, int dn) {
  try {
    switch(dn) {
      case 1:
        demo1(p);
        break;
      case 2:
        demo2(p);
        break;
      case 3:
        demo3(p);
        break;
      case 4:
        demo4(p);
        break;
      case 5:
        demo5(p);
        break;
      case 6:
        demo6(p);
        break;
      case 7:
        demo7(p);
        break;
      case 8:
        demo8(p);
        break;
      case 9:
        demo9(p);
        break;
      case 10:
        demo10(p);
        break;
      case 11:
        demo11(p);
        break;
      case 12:
        demo12(p);
        break;
      default:
        demo1(p);
    }
  } catch(final error) {
    print('Error in demo! -- $error');
  }
}

demo1(var p) {
  p.erase();
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
  p.erase();
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
  p.erase();
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
  p.erase();
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
  p.erase();
  p.color = 'blue';
  p.left(90);
  p.forward(100);
  p.write = 'a';
  p.right(90);
  p.forward(30);
  p.write = '';
  p.right(90);
  p.forward(100);
  p.color = 'black';
  p.left(90);
  p.forward(30);
  p.color = 'red';
  p.left(90);
  p.forward(80);
  p.write = 'b';
  p.right(90);
  p.forward(30);
  p.write = '';
  p.right(90);
  p.forward(80);
  p.color = 'black';
  p.left(90);
  p.forward(30);
  p.color = 'green';
  p.left(90);
  p.forward(140);
  p.write = 'c';
  p.right(90);
  p.forward(30);
  p.write = '';
  p.right(90);
  p.forward(140);
  p.color = 'black';
  p.left(90);
  /*
color, blue;
move, -90;
move, 0, 100;
write, a;
move, 90;
move, 0, 30;
write, ;
move, 90;
move, 0, 100;
color, black;
move, -90;
move, 0, 30;
color, red;
move, -90;
move, 0, 80;
write, b;
move, 90;
move, 0, 30;
write, ;
move, 90;
move, 0, 80;
color, black;
move, -90;
move, 0, 30;
color, green;
move, -90;
move, 0, 140;
write, c;
move, 90;
move, 0, 30;
write, ;
move, 90;
move, 0, 140;
color, black;
move, -90;
  */
}

demo6(var p) {
  var commandsString = 'color, red; move, 45, 80, 1; width, 3; color, yellow; move, 50, 80, 1; width, 2; color, blue; move, 65, 80, 1; down, false; moveTo, 333, 333; down, true; move, 15, 120, 4; all, 7';
  p.erase();
  p.interpret(commandsString);
}

demo7(var p) {
  var commandsString = '''
    color, red; width, 2; move, 15, 160, 2; 
    color, green; width, 1; move, -45, 200, 3; move, 66, 80, 6; 
    color, brown;  width, 2; move, -20, 40, 8; 
    all, 6;
''';
  p.erase();
  p.interpret(commandsString);
}

demo8(var p) {
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
  p.erase();
  p.interpret(commandsString);
}

demo9(var p) {
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
  p.erase();
  p.interpret(commandsString);
}

demo10(var p) {
  multicolorSquare(var size) {
    for (var c in colorList) {
      p.color = c;
      p.forward(size);
      p.left(90);
    }
  }
  p.erase();
  p.width = 2;
  var size = 60;
  for (var i in new List(16)) {
    multicolorSquare(size);
    size = size + 10;       // Increase the size for next time
    p.forward(10);          // Move the pen forward
    p.right(18);
  }
}

demo11(var p) {
  f1(var length, var depth) {
    if (depth == 0) {
      p.forward(length);
    } else {
      f1(length/3, depth-1);
      p.right(60);
      f1(length/3, depth-1);
      p.left(120);
      f1(length/3, depth-1);
      p.right(60);
      f1(length/3, depth-1);
    }
  }
  p.erase();
  f1(240, 4);
  //f1(320, 4);
  //f1(500, 4);
}

demo12(var p) {
  f2(var length, var depth) {
    if (depth == 0) {
      p.move(0, length);
    } else {
      f2(length/3, depth-1);
      p.move(60, length);
      f2(length/3, depth-1);
      p.move(120, length);
      f2(length/3, depth-1);
      p.move(60, length);
      f2(length/3, depth-1);
    }
  }
  p.erase();
  f2(240, 4);
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
  p.interpret(commandsString);
}





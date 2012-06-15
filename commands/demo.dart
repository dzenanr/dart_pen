demo(var p, int dn) {
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
    case 5:
      p.erase();
      demo5(p);
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
  for (var i in [1,2,3,4]) {
    p.all();
  }
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
  for (var i in new List(3)) {
    p.all();
  }
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
  for (var i = 0; i < 6; i++) {
    p.all();
  }
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
  for (var i in new List(8)) {
    p.all();
  }
}

demo5(var p) {
  var commandsString = "color, red; move, 45, 80, 1; width, 3; color, yellow; move, 50, 80, 1; width, 2; color, blue; move, 65, 80, 1; down, false; moveTo, 333, 333; down, true; move, 15, 120, 4; all, 7;";
  pen.toCommands(commandsString);
  pen.interpret();
}



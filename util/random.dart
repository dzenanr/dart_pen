randomNum(num max) => Math.random() * max;

randomInt(int max) => randomNum(max).toInt();

randomListElement(List list) => list[randomInt(list.length - 1)];

randomPoint(num maxX, num maxY) => new Point(randomNum(maxX), randomNum(maxY));

randomSign() {
  int result = 1;
  if (randomInt(10) == 0) {
    result = -1;
  }
  return result;
}

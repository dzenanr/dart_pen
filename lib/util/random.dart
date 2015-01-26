part of dart_pen;

randomDouble(double max) => new Random().nextDouble();

randomInt(int max) => new Random().nextInt(max);

randomListElement(List list) => list[randomInt(list.length - 1)];

randomPoint(double maxX, double maxY) => new Point(randomDouble(maxX), randomDouble(maxY));

randomSign() {
  int result = 1;
  if (randomInt(10) == 0) {
    result = -1;
  }
  return result;
}

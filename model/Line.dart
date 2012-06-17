class Line {

  Line lastLine;

  Point beginPoint;
  num cumulativeAngle = 0;
  num _angle = 0;
  num _pixels = 0;
  Point endPoint;

  Line.first(this.beginPoint) {
    endPoint = beginPoint;
  }

  Line.next(this.lastLine) {
    beginPoint = lastLine.endPoint;
    endPoint = beginPoint;
  }

  void set angle(num angle) {
    _angle = angle;
    if (lastLine == null) {
      cumulativeAngle = angle;
    } else {
      cumulativeAngle = lastLine.cumulativeAngle + angle;
      if (cumulativeAngle > 360) {
        cumulativeAngle = cumulativeAngle - 360;
      }
    }
    endPoint = _findEndPoint();
  }

  num get angle() => _angle;

  void set pixels(num pixels) {
    _pixels = pixels;
    endPoint = _findEndPoint();
  }

  num get pixels() => _pixels;

  Point _findEndPoint() {
    var x1 = beginPoint.x;
    var y1 = beginPoint.y;
    var cumulativeRadian = (cumulativeAngle * Math.PI) / 180;
    var x2 = x1 + (pixels * Math.cos(cumulativeRadian));
    var y2 = y1 + (pixels * Math.sin(cumulativeRadian));
    return new Point(x2, y2);
  }

  Line copy(Line previousLine) {
    Line line = new Line.next(previousLine);
    line.beginPoint = previousLine.endPoint;
    line.angle = angle;
    line.pixels = pixels;
    return line;
  }

}

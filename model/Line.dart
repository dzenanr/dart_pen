class Line {

  Point beginPoint;
  num _angle = 0;
  num _pixels = 0;
  Point endPoint;

  Line(this.beginPoint) {
    endPoint = beginPoint;
  }

  void set angle(num angle) {
    _angle = angle;
    if (angle == 0) {
      endPoint.x = beginPoint.x + _pixels;
      endPoint.y = beginPoint.y;
    } else {
      endPoint = _findEndPoint(beginPoint, _angle, _pixels);
    }
  }

  num get angle() {
    return _angle;
  }

  void set pixels(num pixels) {
    _pixels = pixels;
    if (pixels == 0) {
      endPoint = beginPoint;
    } else {
      endPoint = _findEndPoint(beginPoint, _angle, _pixels);
    }
  }

  num get pixels() {
    return _pixels;
  }

  Point _findEndPoint(Point startPoint, num lineAngle, num lineLength) {
    var x1 = startPoint.x;
    var y1 = startPoint.y;
    var x2 = x1 + (lineLength * Math.cos(lineAngle));
    var y2 = y1 + (lineLength * Math.sin(lineAngle));
    return new Point(x2, y2);
  }

}

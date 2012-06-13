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
        // cumulativeAngle = cumulativeAngle - 360;
      }
    }
    if (angle == 0) {
      endPoint.x = beginPoint.x + pixels;
      endPoint.y = beginPoint.y;
    } else {
      endPoint = _findEndPoint();
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
      endPoint = _findEndPoint();
    }
  }

  num get pixels() {
    return _pixels;
  }

  Point _findEndPoint() {
    var x1 = beginPoint.x;
    var y1 = beginPoint.y;
    var x2 = x1 + (pixels * Math.cos(cumulativeAngle));
    var y2 = y1 + (pixels * Math.sin(cumulativeAngle));
    return new Point(x2, y2);
  }

}

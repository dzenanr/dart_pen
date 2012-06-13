class Pen {

  static final int SIZE = 4;

  bool down = true;
  String _colorName = 'black';
  String _colorCode = '#000000';

  var path;

  Pen(Point startPosition) {
    path = new Path();
    var startSegment = new Segment(1, draw:false);
    startSegment.lines[0] = new Line.first(startPosition);
    path.segments.add(startSegment);
  }

  void set colorName(String colorName) {
    _colorName = colorName;
    if (colorName == 'black') {
      _colorCode = '#000000';
    } else if (colorName == 'blue') {
      _colorCode = '#0000ff';
    } if (colorName == 'red') {
      _colorCode = '#ff0000';
    }
  }

  String get colorCode() {
    return _colorCode;
  }

}

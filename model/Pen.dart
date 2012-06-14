class Pen {

  bool down = true;
  String color = 'black';
  int width = 1;

  var path;

  Pen(Point startPosition) {
    path = new Path();
    var startSegment = new Segment(1, draw:false);
    startSegment.lines[0] = new Line.first(startPosition);
    path.segments.add(startSegment);
  }

}

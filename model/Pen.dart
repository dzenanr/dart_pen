class Pen {

  var path;

  Pen(Point startPosition) {
    path = new Path();
    var startSegment = new Segment(1, draw:false);
    startSegment.lines[0] = new Line(startPosition); 
    path.segments.add(startSegment);
  }

}

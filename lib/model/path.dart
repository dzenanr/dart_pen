part of dart_pen;

class Path {

  var segments;

  Path() {
    segments = new List<Segment>();
  }

  Line lastLine() {
    Line last;
    try {
      last = segments.last.lastLine();
    } catch(error) {
      print('Error in finding the last line of the path! -- $error');
    }
    return last;
  }

  double() {
    try {
      var copiedSegments = new List<Segment>();
      Line last = lastLine();
      for (var i = 0; i < segments.length; i++) {
        Segment segment = segments[i].copy(last);
        copiedSegments.add(segment);
        last = segment.lastLine();
      }
      for (Segment copiedSegment in copiedSegments) {
        segments.add(copiedSegment);
      }
    } catch(error) {
      print('Error in doubling the path! -- $error');
    }
  }

  String toString() {
    var path = 'Path \n';
    path = '$path segment count: ${segments.length} \n';
    var lineCount = 0;
    for (Segment segment in segments) {
      lineCount = lineCount + segment.lines.length;
    }
    path = '$path line count: $lineCount \n';
    path = '$path \n';
    for (Segment segment in segments) {
      path = '$path Segment \n';
      path = '$path line count: ${segment.lineCount} \n';
      path = '$path drawn: ${segment.drawn} \n';
      path = '$path color: ${segment.color} \n';
      path = '$path width: ${segment.width} \n';
      path = '$path text: ${segment.text} \n';
      path = '$path \n';
      for (Line line in segment.lines) {
        path = '$path Line \n';
        path = '$path begin point x: ${line.beginPoint.x} \n';
        path = '$path begin point y: ${line.beginPoint.y} \n';
        path = '$path angle: ${line.angle} \n';
        path = '$path cumulative angle: ${line.cumulativeAngle} \n';
        path = '$path pixels: ${line.pixels} \n';
        path = '$path end point x: ${line.endPoint.x} \n';
        path = '$path end point y: ${line.endPoint.y} \n';
        path = '$path \n';
      }
    }
    return path;
  }

}

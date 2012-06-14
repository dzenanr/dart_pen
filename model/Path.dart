class Path {

  var segments;

  Path() {
    segments = new List<Segment>();
  }

  String toString() {
    var path = 'Path \n';
    path = '$path segment count: ${segments.length} \n';
    path = '$path \n';
    for (Segment segment in segments) {
      path = '$path Segment \n';
      path = '$path line count: ${segment.lineCount} \n';
      path = '$path draw: ${segment.draw} \n';
      path = '$path color: ${segment.color} \n';
      path = '$path width: ${segment.width} \n';
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

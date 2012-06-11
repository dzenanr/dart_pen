class Segment {

  num lineCount;
  bool draw;

  var lines;

  Segment(this.lineCount, [this.draw = true]) {
    lines = new List<Line>(lineCount);
  }

}

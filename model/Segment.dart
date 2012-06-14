class Segment {

  num lineCount;
  bool draw;
  String color = 'black';
  int width = 1;

  var lines;

  Segment(this.lineCount, [this.draw = true]) {
    lines = new List<Line>(lineCount);
  }

}

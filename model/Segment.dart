class Segment {

  num lineCount;
  bool draw;
  String colorCode = '#000000'; // black

  var lines;

  Segment(this.lineCount, [this.draw = true]) {
    lines = new List<Line>(lineCount);
  }

}

class Segment {

  num lineCount;
  bool draw;
  String color = 'black';
  int width = 1;

  var lines;

  Segment(this.lineCount, [this.draw = true]) {
    lines = new List<Line>(lineCount);
  }

  Segment copy(Line lastLine) {
    Segment segment = new Segment(lineCount);
    segment.draw = draw;
    segment.color = color;
    segment.width = width;
    Line previousLine = lastLine;
    for (var i = 0; i < lineCount; i++) {
      Line line = lines[i].copy(previousLine);
      segment.lines[i] = line;
      previousLine = line;
    }
    return segment;
  }

}

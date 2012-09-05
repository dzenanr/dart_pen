class Segment {

  num lineCount;
  bool drawn;
  String color = 'black';
  int width = 1;
  String text = '';

  var lines;

  Segment(this.lineCount, [this.drawn = true]) {
    lines = new List<Line>(lineCount);
  }

  bool isDrawn() => drawn;

  Line lastLine() {
    Line last;
    try {
      last = lines.last();
    } catch(error) {
      print('Error in finding the last line of the segment! -- $error');
    }
    return last;
  }

  Segment copy(Line last) {
    Segment segment = new Segment(lineCount);
    segment.drawn = drawn;
    segment.color = color;
    segment.width = width;
    segment.text = text;
    Line previousLine = last;
    for (var i = 0; i < lineCount; i++) {
      Line line = lines[i].copy(previousLine);
      segment.lines[i] = line;
      previousLine = line;
    }
    return segment;
  }

}

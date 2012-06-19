class Segment {

  num lineCount;
  bool draw;
  String color = 'black';
  int width = 1;
  String text = '';

  var lines;

  Segment(this.lineCount, [this.draw = true]) {
    lines = new List<Line>(lineCount);
  }

  Line lastLine() {
    Line last;
    try {
      last = lines.last();
    } catch(final error) {
      print('Error in finding the last line of the segment! -- $error');
    }
    return last;
  }

  Segment copy(Line last) {
    Segment segment = new Segment(lineCount);
    segment.draw = draw;
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

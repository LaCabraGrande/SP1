class Painting {
   ArrayList<Line> lines;
  
  Painting () {
    lines = new ArrayList<Line>(); 
  }

  void addLine(float tempPpmousex, float tempPmouseY, float tempMouseX, float tempMouseY, float tempStroke, color tempColor) {
    Line newLine = new Line(tempPpmousex,tempPmouseY,tempMouseX,tempMouseY,tempStroke,tempColor);
    lines.add(newLine);
  }  

  void display() {
    background(255);
    for(Line line : lines) {
      line.display();  
    }
  }

}

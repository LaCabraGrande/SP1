class Line {
  float xposp,yposp,xpos,ypos,s;
  color c;
  
  Line(float tempXposp, float tempYposp, float tempXpos, float tempYpos, float tempS, color tempColor) {
    xposp = tempXposp;
    yposp = tempYposp;
    xpos = tempXpos;
    ypos = tempYpos;
    s = tempS;
    c = tempColor;
  }
  
  void display() {
    stroke(c);
    strokeWeight(s);
    line(xposp, yposp, xpos, ypos);
  }
}

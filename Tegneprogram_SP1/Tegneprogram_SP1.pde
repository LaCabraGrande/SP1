// SP 1 
//I have chosen to make a small drawing program where I demonstrate the use of Arrays and ArrayLists. You can scroll through the drawings you have made and add new lines.
// You also have the option to delete something by holding down the right mouse button.
 
int z = 1; // declaring of the counter for the Paintings
int tempZ; // this variable helps me when i print out my Paintings
boolean keyN = false; // I initialize and declare a boolean character which is used to start a new Painting
boolean keyA = false; // I use the KeyA og KeyD for scrolling through my paintings 
boolean keyD = false;
boolean keyF = false; // the KeyF is used for painting with a fat line
boolean keyG = false; // these are used for color variables
boolean keyB = false;
boolean keyR = false;
boolean keyY = false;
boolean keyS = false;
color currentColor = color(0,0,0);
int strokeW = 1;
String colorCode = "black";
Painting[] painting = new Painting[z]; // I initialize the Painting array of objects 

void setup() {
  size(800,800);
  background(255);
  painting[0] = new Painting(); // I declare the first object of the class Painting which must only contain an array of objects of the class Line
}

void draw() {
  text();
  if(mousePressed) {
    if (mouseButton == LEFT && mouseX>=5 && pmouseX>=5 && mouseX<=(width-5) && pmouseX<=(width-5) && mouseY>=100 && pmouseY>=100 && mouseY<=(height-100) && pmouseY<=(height-100)) {
      stroke(currentColor);
      strokeWeight(strokeW);
      line(pmouseX, pmouseY, mouseX, mouseY);
      painting[tempZ].addLine(pmouseX,pmouseY,mouseX,mouseY,strokeW,currentColor); // using the addLine method, I extend the Line ArrayList with a new Line with the mouse's coordinates
    } else if(mouseButton == RIGHT) { // I erase with white if I hold the right mouse button down while drawing
      stroke(255,255,255);
      strokeWeight(10);
      line(pmouseX, pmouseY, mouseX, mouseY);
      painting[tempZ].addLine(pmouseX,pmouseY,mouseX,mouseY,5,color (255,255,255)); // here, using the addLine method, I extend the Line ArrayList with a new Line with the mouse's coordinates
    }  
  }
}

void keyPressed() {
  if(key == 'n' && !keyN || key == 'N' && !keyN) {
    z++;
    tempZ = z-1;
    background(255);
    stroke(0);
    keyN = true;
  }
  if(key == 'a' && !keyA && tempZ>0 || key == 'A' && !keyA && tempZ>0) {
    tempZ--;
    painting[tempZ].display();
    keyA = true;
  } else if(key == 'a' && !keyA && tempZ == 0 || key == 'A' && !keyA && tempZ == 0) {
    tempZ = painting.length-1;
    painting[tempZ].display();
    keyA = true;
  }  
  
  if(key == 'd' && !keyD && tempZ<(z-1)|| key == 'D' && !keyD && tempZ<(z-1)) {
    tempZ++;
    painting[tempZ].display();
    keyD = true;
  } else if(key == 'd' && !keyD && tempZ==(z-1)|| key == 'D' && !keyD && tempZ==(z-1)) {
    tempZ = 0;
    painting[tempZ].display();
    keyD = true;
  }  
  
  if(key == 'f' && !keyF || key == 'F' && !keyF) {
     keyF = true;
     strokeW += 1;
  } else if(key == 'f' && keyF || key == 'F' && keyF) { 
     strokeW += 1;
  }
  if(key == 'h' || key == 'H') {
     keyF = false;
     strokeW = 1;
  }
  
  if(key == 'g' && !keyG && tempZ<(z-1)|| key == 'G' && !keyG && tempZ<(z-1)) {
     keyG = true;
  }
  if(key == 'b' && !keyB && tempZ<(z-1)|| key == 'D' && !keyB && tempZ<(z-1)) {
     keyB = true;
  }
  if(key == 'r' && !keyR && tempZ<(z-1)|| key == 'D' && !keyR && tempZ<(z-1)) {
     keyR = true;
  }
  if(key == 'y' && !keyY && tempZ<(z-1)|| key == 'Y' && !keyY && tempZ<(z-1)) {
     keyY = true;
  }
  if(key == 's' && !keyS && tempZ<(z-1)|| key == 'S' && !keyS && tempZ<(z-1)) {
     keyS = true;
  }
}

void keyReleased() {
  if(key == 'n' || key == 'N') {
    keyN = false;
    background(255);
    currentColor = color(0,0,0);
    colorCode = "black";
    strokeW = 1;
    keyF = false;
    Painting[] newPainting = new Painting[painting.length+1]; // A new object of the Painting type is initiated
    for (int i = 0; i < painting.length; i++) { // All objects of Drawing are copied into the new array newDrawing
      newPainting[i] = painting[i];
    }
    newPainting[painting.length] = new Painting(); 
    painting = newPainting; // The temporary array newDrawing is copied into the old array newDrawing
    // painting = (Painting[]) append(painting, new Painting()); // I could also have used the method append to extend the Array Painting[]
  }
  if(key == 'a' || key == 'A') {
    keyA = false;
  }
  if(key == 'd' || key == 'D') {
    keyD = false;
  }
  if(key == 'g' || key == 'G') {
    currentColor = color(0,255,0);
    colorCode = "green";
  }
  if(key == 'y' || key == 'Y') {
    currentColor = color(255,255,0);
    colorCode = "yellow";
  }
  if(key == 'b' || key == 'B') {
    currentColor = color(0,0,255);
    colorCode = "blue";
  }
  if(key == 'r' || key == 'R') {
    currentColor = color(255,0,0);
    colorCode = "red";
  }
  if(key == 's' || key == 'S') {
    currentColor = color(0,0,0);
    colorCode = "black";
  }
  
}
  
void text() {
  fill(255);
  noStroke();
  rect(0,0,800,60);
  textSize(20);
  fill(0, 0, 0);
  text("Painting : "+(tempZ+1), 30, 40);
  text("Color :           ", 300, 40);
  text("Color : "+colorCode, 300, 40);
  if(keyF) {
    fill(0, 0, 0);
    text("Fed", 600, 40);
  } else {
    text("     ",600,40);
  }  
  text("-------------------------------------------------------------------------------------------------------------------------------",5,70);
  text("-------------------------------------------------------------------------------------------------------------------------------",5,730);
  text("Y = yellow      R = red      B = blue      G = green      S = black", 30,750);
  text("N = new painting      A = previously painting      D = next painting      F = fat on      H = fat off", 30,770);  
}  
  
     

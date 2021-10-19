int foodSize = 15;
int [] food = new int [6];
Bacteria [] bob = new Bacteria[100];
void setup()   
{     
  size (800, 800);
  for (int i = 0; i<bob.length; i++) {
    bob[i] = new Bacteria (400, 400);
  }
  for (int i = 0; i<food.length; i++) {
    food[i] = (int)(Math.random()*300)+250;
  }
}   
void draw()   
{    
  background(0, 0, 0);
  stroke(255);
  noFill();
  rectMode(CENTER);
  rect(400, 400, 700, 700);
  for (int j=0; j<5; j++) {
    for (int i = 0; i < bob.length; i++) {
      bob[i].move();
      bob[i].show();
      bob[i].feed();
    }
  }
  fill (250, 200, 0);
  for (int i = 1; i<(food.length); i+=2) {
    rectMode(CORNER);
    rect(food[i-1], food [i], foodSize, foodSize);
  }
}  
class Bacteria   
{     
  int myX, myY, myColour, mySize;
  Bacteria(int x, int y) {
    myX = x;
    myY = y;
    myColour = color((int)(Math.random()*100)+150, (int)(Math.random()*100)+150, (int)(Math.random()*100)+150);
    mySize = 2;
  }
  void show() {
    noStroke();
    fill(myColour);
    ellipse(myX, myY, mySize, mySize);
  }
  void move() {
    if (myX<55+mySize/2) {
      myX=myX+(int)(Math.random()*2);
    } else if (myX>745-mySize/2) {
      myX=myX+(int)(Math.random()*2)-2;
    } else {
      myX=myX+(int)(Math.random()*5)-2;
    }

    if (myY<55+mySize/2) {
      myY=myY+(int)(Math.random()*2);
    } else if (myY>745-mySize/2) {
      myY=myY+(int)(Math.random()*2)-2;
    } else {
      myY=myY+(int)(Math.random()*5)-2;
    }
  }
  void feed() {
    for (int i = 1; i<(food.length); i+=2) {
      if (myX > food[i-1] && myX < food[i-1]+foodSize) { // x is within food x
        if (myY > food[i] && myY < food[i]+foodSize) {// y is within food y
          mySize=mySize+5;
          food[i-1]=(int)(Math.random()*600)+100;
          food[i]=(int)(Math.random()*600)+100;
        }
      }
    }
  }
  void reset() {
    myX=400;
    myY=400;
    mySize=2;
  }
}
void mouseClicked() {
  for (int i = 0; i < bob.length; i++) {
    bob[i].reset();
  }
}

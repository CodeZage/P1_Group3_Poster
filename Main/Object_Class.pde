//Class for making objects such as buttons, images and text on the screen
class Object {

  float posX;
  float posY;
  float sizeX;
  float sizeY;
  PShape vector;
  PImage image;
  String text;

  Object(float x1, float y1, float x2, float y2, PShape v) {
    posX = x1;
    posY = y1;
    sizeX = x2;
    sizeY = y2;
    vector = v;
  }

  Object(float x1, float y1, float x2, float y2, PImage i) {
    posX = x1;
    posY = y1;
    sizeX = x2;
    sizeY = y2;
    image = i;
  }

  Object(float x1, float y1, float x2, float y2, String t) {
    posX = x1;
    posY = y1;
    sizeX = x2;
    sizeY = y2;
    text = t;
  }

  Object(float x1, float y1, float x2, float y2, PShape v, PImage i, String t) {
    posX = x1;
    posY = y1;
    sizeX = x2;
    sizeY = y2;
    vector = v;
    image = i;
    text = t;
  }

  void drawObject() {
    shape(vector, posX, posY, sizeX, sizeY);
  }

  void drawText(PFont font, color col) {
    textAlign(CENTER);
    fill(col);
    textFont(font);
    text(text, posX, posY + sizeY / 10, sizeX, sizeY);
  }

  void drawImage() {
    image(image, posX, posY, sizeX, sizeY);
  }

  void drawBox(color col) {
    if (mouseOver() == true) {
      fill(col);
    }
    if (mouseOver() == true && mousePressed) {
      index = 0;
    }
    rect(posX, posY, sizeX, sizeY);
  }
  
  boolean mouseOver() {
    if (mouseX > posX && mouseX < posX + sizeX && mouseY > posY && mouseY < posY + sizeY) {
      return true;
    } else return false;
  }
}
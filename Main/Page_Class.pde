//This class is for drawing the background pages of the document

class Page {

  float posX;
  float posY;
  float sizeX;
  float sizeY;
  PShape vector;

  Page(float x1, float y1, float x2, float y2, PShape v) {

    posX = x1;
    posY = y1;
    sizeX = x2;
    sizeY = y2;
    vector = v;
  }

  color mouseOverHighlight  = (90);

  void drawPage() {
    rect(posX, posY-index, sizeX, sizeY);
  }
  
 
  
  void drawVectorPage() {
    shape(vector, posX, posY, sizeX, sizeY);
  }
}

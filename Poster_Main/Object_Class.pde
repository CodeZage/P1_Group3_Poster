class Object {

  float posX;
  float posY;
  float sizeX;
  float sizeY;
  PShape vector;

  Object(float x1, float y1, float x2, float y2, PShape v) {

    posX = x1;
    posY = y1;
    sizeX = x2;
    sizeY = y2;
    vector = v;
  }
}

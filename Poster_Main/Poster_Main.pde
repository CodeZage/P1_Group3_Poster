int index = 0;
int pageCap = 50;
String b = "Hello World";
PShape empty;
float margin = 4;

Page[] pages = new Page[10];

void setup() {

  size(1000, 1000);
  surface.setResizable(true);
}

void draw() {

  for (int i = 0; i < pages.length; i++) {
    pages[i] = new Page(0, height*i, width-1, height, vectorGraphicsPage[i]); //Creates all objects in a sequential order for easy organisation. 
  }

  for (int i = 0; i < pages.length; i++) {
    pages[i].drawPage();
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e < 0 && index > 0) {
    index -= 50;
  }
  if (e > 0 && index < height*(pages.length-1)) {
    index += 50;
  }
}

int index = 0;
int pageCap = 50;
float margin = 4;

Page[] pages = new Page[5];
Object Box;

void setup() {
  size(1000, 1000);
  surface.setResizable(true);
}

void draw() {

  stroke(1);
  fill(255);
  for (int i = 0; i < pages.length; i++) {
    pages[i] = new Page(0, height*i, width-1, height, vectorGraphicsPage[i]); //Creates all objects in a sequential order for easy organisation.
  }

  for (int i = 0; i < pages.length; i++) {
    pages[i].drawPage();
  }
  
  Box = new Object(width / 2 - 50, height * pages.length - index - 100, 100, 30, button);
  fill(#FFC86F);
  Box.drawBox();
  Box.drawText();
  Box.mouseOver();
  
    
  //Draws scroll distance indicator to the right of the screen. 
  fill(#FFC86F);
  noStroke();
  rect(width - margin, -margin, 5, margin / 1 + index * 1.25 / pages.length);
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

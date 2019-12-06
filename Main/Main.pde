int index = 0; //Tracks current position of the viewport
float margin = 4;


Page[] pages = new Page[5];
Object Box;
Object RoomPageImage; 

void setup() {
  size(1600, 1000);
  surface.setResizable(true);
  frameRate(60);
  
  robotoBlack = createFont("Roboto-Black.ttf", 40); 
  roomPageImage = loadImage("Images/rumbillede.jpg");
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
  
  
  Box = new Object(width / 2 - 125, height * 5 - index - 100, 250, 60, button);
  RoomPageImage = new Object (margin, height + margin * 1 - index, width - margin * 2, height - margin * 2, roomPageImage); 
  
  
  fill(#FFC86F);
  
  RoomPageImage.drawImage();
  
  Box.drawBox(#41DE98);
  Box.drawText(robotoBlack, 0);
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

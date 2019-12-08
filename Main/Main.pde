int index = 0; //Tracks current position of the viewport
float margin = 4;
boolean mouseClick = false;


Page[] pages = new Page[5];
Object ResetButton;
Object RoomPageImage; 
Object RoomPageText;

void setup() {
  size(1600, 1000);
  frameRate(60);
  smooth(8);

  robotoBlack20 = createFont("Roboto-Black.ttf", 25); 
  robotoBlack40 = createFont("Roboto-Black.ttf", 40); 

  robotoThin22 = createFont("Roboto-Thin.ttf", 22);

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


  ResetButton = new Object(width / 2 - 125, 
    height * 5 - index - 100, 
    250, 
    60, 
    button);

  RoomPageImage = new Object(
    width / 2 - margin * 2, 
    height * 1.25 + margin * 2 - index, 
    width / 2 - margin * 10, 
    height / 2 - margin * 2, 
    roomPageImage); 

  RoomPageText = new Object(
    margin * 10, 
    height * 1.25 - index, 
    width / 2 - 120, 
    height / 2, 
    imgText); 

  fill(#FFC86F);

  RoomPageImage.drawImage();

  ResetButton.drawBox(#41DE98);
  ResetButton.drawTextCenter(robotoBlack40, 0);
  ResetButton.mouseOver();
  ResetButton.clickObject();
  ResetButton.scrollToPoint(1000);

  RoomPageText.drawTextLeft(robotoThin22, 0);
  
  println(index);



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

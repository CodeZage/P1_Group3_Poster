int index = 0; //Tracks current position of the viewport
float margin = 4;
boolean mouseClick = false;

Page[] pages = new Page[5];
//Button Objects
Object ResetButton;
//Image Objects
Object FrontPageImage;
Object RoomPageImage; 
//Text Objects
Object RoomPageText;

void setup() {
  size(1920, 1080);
  frameRate(60);
  smooth(8);

  robotoBlack20 = createFont("Roboto-Black.ttf", 25); 
  robotoBlack40 = createFont("Roboto-Black.ttf", 40); 

  robotoThin22 = createFont("Roboto-Thin.ttf", 22);

  frontPageImage = loadImage("Images/frontImage.png");
  vrPageImage = loadImage("Images/vrImage.png");
  roomPageImage = loadImage("Images/roomImage.jpg");
}

void draw() {

  stroke(1);
  fill(245);

  for (int i = 0; i < pages.length; i++) {
    pages[i] = new Page(0, height*i, width-1, height, vectorGraphicsPage[i]); //Creates all objects in a sequential order for easy organisation.
    pages[i].drawPage();
  }

  FrontPageImage = new Object(
    0, 
    0 - index, 
    width, 
    height, 
    frontPageImage);

  RoomPageText = new Object(
    margin * 10, 
    height * 1.25 - index, 
    width / 2 - 120, 
    height / 2, 
    imgText); 

  RoomPageImage = new Object(
    width / 2 - margin * 2, 
    height * 1.25 + margin * 2 - index, 
    width / 2 - margin * 10, 
    height / 2 - margin * 2, 
    roomPageImage); 

  ResetButton = new Object(width / 2 - 125, 
    height * 5 - index - 100, 
    250, 
    60, 
    button);



  fill(#FFC86F);
  FrontPageImage.drawImage();

  RoomPageText.drawTextLeft(robotoThin22, 0);

  RoomPageImage.drawImage();


  ResetButton.drawBox(#41DE98, #FFC86F);
  ResetButton.drawTextCenter(robotoBlack40, 0);
  ResetButton.mouseOver();
  ResetButton.clickObject();
  ResetButton.scrollToPoint(1080);


  println(index);



  //Draws scroll distance indicator to the right of the screen. 
  fill(#FFC86F);
  noStroke();
  rect(width - margin, -margin, 5, margin / 1 + index * 1.25 / pages.length);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e < 0 && index > 0) {
    index -= 54;
  }
  if (e > 0 && index < height*(pages.length-1)) {
    index += 54;
  }
}

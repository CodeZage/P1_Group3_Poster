int index = 0; //Tracks current position of the viewport
float margin = 4;
boolean mouseClick = false;

Page[] pages = new Page[5];
//Button/Box Objects
Object FrontPageBox;
Object ResetButton;
//Image Objects
Object FrontPageImage;
Object VrPageImage;
Object RoomPageImage; 
//Text Objects
Object FrontPageText1; 
Object FrontPageText2; 
Object FrontPageText3; 
Object VrPageTextBox; 
Object RoomPageText;

void setup() {
  size(1920, 1080);
  frameRate(60);
  smooth(8);

  robotoBlack20 = createFont("Roboto-Black.ttf", 25); 
  robotoBlack40 = createFont("Roboto-Black.ttf", 40); 
  robotoBlack80 = createFont("Roboto-Black.ttf", 80);
  robotoBlack180 = createFont("Roboto-Black.ttf", 180);

  robotoThin22 = createFont("Roboto-Thin.ttf", 22);
  robotoThin40 = createFont("Roboto-Thin.ttf", 40);
  robotoThin80 = createFont("Roboto-Thin.ttf", 80);
  robotoThin180 = createFont("Roboto-Thin.ttf", 180);

  robotoLight22 = createFont("Roboto-Light.ttf", 22);
  robotoLight40 = createFont("Roboto-Light.ttf", 40);
  robotoLight80 = createFont("Roboto-Light.ttf", 80);
  robotoLight180 = createFont("Roboto-Light.ttf", 180);


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

  //Page 1 ----------------------------------------------------------------------------------------------------------------------------------

  FrontPageImage = new Object(
    0, 
    0 - index, 
    width, 
    height);

  FrontPageText1 = new Object(
    0, 
    180 - index, 
    width, 
    height);

  FrontPageText2 = new Object(
    0, 
    380 - 20 - index, 
    width, 
    height);

  FrontPageText3 = new Object(
    0, 
    height/2 + 60 - 40 - index, 
    width, 
    height);

  FrontPageBox = new Object(
    0, 
    280 - index, 
    width, 
    height/2);

  //Page 2 ----------------------------------------------------------------------------------------------------------------------------------

  VrPageImage = new Object(
    0, 
    height - index, 
    width, 
    height);

  RoomPageText = new Object(
    margin * 10, 
    height * 3.25 - index, 
    width / 2 - 120, 
    height / 2); 

  RoomPageImage = new Object(
    width / 2 - margin * 2, 
    height * 3.25 + margin * 2 - index, 
    width / 2 - margin * 10, 
    height / 2 - margin * 2); 

  ResetButton = new Object(width / 2 - 125, 
    height * 5 - index - 100, 
    250, 
    60);


  //Page 1 ----------------------------------------------------------------------------------------------------------------------------------

  FrontPageImage.drawImage(frontPageImage);

  FrontPageBox.drawBox(0, 0, 70, 0);

  FrontPageText1.drawTextCenter(frontPageText1, robotoLight180, 230);
  FrontPageText2.drawTextCenter(frontPageText2, robotoLight180, 230);
  FrontPageText3.drawTextCenter(frontPageText3, robotoLight80, 230);


  //Page 2 ----------------------------------------------------------------------------------------------------------------------------------

  VrPageImage.drawImage(vrPageImage);

  //Page 3 ----------------------------------------------------------------------------------------------------------------------------------


  //Page 4 ----------------------------------------------------------------------------------------------------------------------------------


  RoomPageText.drawTextLeft(imgText, robotoThin22, 0);

  RoomPageImage.drawImage(roomPageImage);

  //Page 5 ----------------------------------------------------------------------------------------------------------------------------------

  ResetButton.drawBox(#41DE98, #FFC86F, 100, 10);
  ResetButton.drawTextCenter(button, robotoBlack40, 0);
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

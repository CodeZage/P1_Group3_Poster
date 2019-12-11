//Atom test
//Atom test 2

int index = 0; //Tracks current position of the viewport
float margin = 4;
boolean mouseClick = false;

color highlightColor = #1FCCFF;
color selectionColor = #0A9AC4;

Page[] pages = new Page[6];

//Button/Box/Line Objects
Object FrontPageBox;
Object ResetButton;

Object VrButton;
Object FirstaidButton;

Object ListLineVertical;
Object ListLineHorizontalVr;
Object ListLineHorizontalFirstaid;

//Image Objects
Object FrontPageImage;
Object VrPageImage;
Object RoomPageImage;

//Text Objects
Object FrontPageText1;
Object FrontPageText2;
Object FrontPageText3;
Object ScrollInform;

Object VrPageText;

Object VrTitle;
Object FirstAidTitle;
Object[] VrList = new Object[4];
Object[] FirstAidList = new Object[4];

Object Citation;
Object CitationName;

Object RoomPageTitle;
Object RoomPageSubTitle;
Object LineHorizontalRoom;
Object RoomPageText;

Object Page5Title;
Object[] Page5Top = new Object[3];
Object[] Page5TopText = new Object[3];
Object[] LineHorizontalTop = new Object[3];

Object[] Page5Bottom = new Object[3];
Object[] Page5BottomText = new Object[3];
Object[] LineHorizontalBottom = new Object[3];

Object Page6Title;
Object[] Page6Top = new Object[3];
Object[] Page6TopText = new Object[3];
Object[] LineHorizontalTop6 = new Object[3];




void setup() {
  fullScreen();
  frameRate(60);
  smooth(8);

  robotoBlack20 = createFont("Roboto-Black.ttf", 25);
  robotoBlack40 = createFont("Roboto-Black.ttf", 40);
  robotoBlack80 = createFont("Roboto-Black.ttf", 80);
  robotoBlack180 = createFont("Roboto-Black.ttf", 180);

  robotoThin22 = createFont("Roboto-Thin.ttf", 22);
  robotoThin40 = createFont("Roboto-Thin.ttf", 40);
  robotoThin80 = createFont("Roboto-Thin.ttf", 80);
  robotoThin120 = createFont("Roboto-Thin.ttf", 120);
  robotoThin180 = createFont("Roboto-Thin.ttf", 180);

  robotoLight28 = createFont("Roboto-Light.ttf", 28);
  robotoLight40 = createFont("Roboto-Light.ttf", 40);
  robotoLight50 = createFont("Roboto-Light.ttf", 50);
  robotoLight60 = createFont("Roboto-Light.ttf", 60);
  robotoLight80 = createFont("Roboto-Light.ttf", 80);
  robotoLight180 = createFont("Roboto-Light.ttf", 180);

  robotoLightItalic40 = createFont("Roboto-LightItalic.ttf", 40);
  robotoLightItalic50 = createFont("Roboto-LightItalic.ttf", 50);
  robotoLightItalic80 = createFont("Roboto-LightItalic.ttf", 80);


  frontPageImage = loadImage("Images/frontImage.png");
  vrPageImage = loadImage("Images/vrImage.png");
  roomPageImage = loadImage("Images/roomImage.jpg");
}

void draw() {

  noStroke();
  fill(245);

  for (int i = 0; i < pages.length; i++) {
    pages[i] = new Page(0, height*i, width-1, height); //Creates all objects in a sequential order for easy organisation.
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

  ScrollInform = new Object(
    0,
    height - 150 - index,
    width,
    height/2);


  FrontPageImage.drawImage(frontPageImage);

  FrontPageBox.drawBox(0, 0, 70, 0);

  FrontPageText1.drawTextCenter(frontPageText1, robotoLight180, 230);
  FrontPageText2.drawTextCenter(frontPageText2, robotoLight180, 230);
  FrontPageText3.drawTextCenter(frontPageText3, robotoLight80, 230);

  ScrollInform.drawTextCenter(scrollInformText, robotoLightItalic40, 240);

  //Page 2 ----------------------------------------------------------------------------------------------------------------------------------

  VrPageImage = new Object(
    0,
    height - index,
    width,
    height);

  VrPageText = new Object(
    width - 700,
    height * 2 + 250 - index * 2,
    600,
    600);

  VrPageImage.drawImage(vrPageImage);
  VrPageText.drawBox(selectionColor, selectionColor, 150, 10);
  VrPageText.drawTextLeft(vrText, robotoLight28, 0);

  //Page 3 ----------------------------------------------------------------------------------------------------------------------------------

  VrTitle = new Object(
    -500,
    height * 2.12 - index,
    width,
    300);

  FirstAidTitle = new Object(
    480,
    height * 2.12 - index,
    width,
    300);

  ListLineVertical = new Object(
    width/2 - 1,
    height * 2.3 - index,
    1,
    height * 0.6);

  ListLineHorizontalVr = new Object(
    200,
    height * 2.25 - index,
    540,
    1);

  ListLineHorizontalFirstaid = new Object(
    width - 740,
    height * 2.25 - index,
    540,
    1);

  for (int i = 0; i < VrList.length; i++) {
    VrList[i] = new Object(0, height * 2.35 - index + i * 120, width/2, 100); //Creates all objects in a sequential order for easy organisation.
    VrList[i].drawTextCenter(vrListText[i], robotoThin80, 0);
    //VrList[i].drawBox(highlightColor, highlightColor, 100, 10);
  }

  for (int i = 0; i < FirstAidList.length; i++) {
    FirstAidList[i] = new Object(width/2, height * 2.35 - index + i * 120, width/2, 100); //Creates all objects in a sequential order for easy organisation.
    FirstAidList[i].drawTextCenter(firstaidListText[i], robotoThin80, 0);
    //FirstAidList[i].drawBox(highlightColor, highlightColor, 100, 10);
  }

  VrTitle.drawTextCenter(vrTitleText, robotoLight80, selectionColor);
  FirstAidTitle.drawTextCenter(firstaidTitleText, robotoLight80, selectionColor);

  //VrTitle.drawBox(highlightColor, highlightColor, 100, 10);
  //FirstAidTitle.drawBox(highlightColor, highlightColor, 100, 10);

  ListLineVertical.drawBox(20, 20, 255, 0); //Created a line with a box because for some reason the line() function didn't work
  ListLineHorizontalFirstaid.drawBox(20, 20, 255, 0);
  ListLineHorizontalVr.drawBox(20, 20, 255, 0);


/*  VrButton = new Object(
    width / 2 - 600,
    height * 3 - index - 180,
    250,
    60);

  FirstaidButton = new Object(
    width / 2 + 350,
    height * 3 - index - 180,
    250,
    60);

  VrButton.drawBox(selectionColor, highlightColor, 100, 10);
  VrButton.drawTextCenter(read, robotoLightItalic40, 30);
  VrButton.mouseOver();
  VrButton.clickObject();
  //VrButton.scrollToPointDown(0);

  FirstaidButton.drawBox(selectionColor, highlightColor, 100, 10);
  FirstaidButton.drawTextCenter(read, robotoLightItalic40, 30);
  FirstaidButton.mouseOver();
  FirstaidButton.clickObject();
  //FirstaidButton.scrollToPointDown(0); */


  Citation = new Object(
    width/2,
    height * 3.06 - index,
    800,
    300);

  CitationName = new Object(
    width/2,
    height * 3.09 - index,
    600,
    300);

  rectMode(CENTER);
  Citation.drawTextCenter(citationText, robotoLightItalic40, 70);
  rectMode(CORNER);
  CitationName.drawTextCenter(citationNameText, robotoLight40, 70);


  //Page 4 ----------------------------------------------------------------------------------------------------------------------------------
  float page4Parralax = 1.8; //Set to 1 to disable parralax
  int page4Offset = 2600; //If parralax is disabled set to 0

  RoomPageTitle = new Object(
    margin * 10,
    height * 3.05 - index * page4Parralax + page4Offset,
    width / 2 - 120,
    height / 2);

  RoomPageSubTitle = new Object(
    margin * 10,
    height * 3.15 - index * page4Parralax + page4Offset,
    width / 2 - 120,
    height / 2);

  LineHorizontalRoom = new Object(
    margin * 21,
    height * 3.25 - index * page4Parralax + page4Offset,
    540,
    1);

  RoomPageText = new Object(
    margin * 10,
    height * 3.25 - index * page4Parralax + page4Offset,
    width / 2 - 120,
    height-400);

  RoomPageImage = new Object(
    width / 2 - margin * 2,
    height * 3.25 + margin * 2 - index,
    width / 2 - margin * 10,
    height / 2 - margin * 2);

  RoomPageTitle.drawTextLeft(roomTitleText, robotoLight80, selectionColor);
  RoomPageSubTitle.drawTextLeft(roomSubTitleText, robotoLightItalic40, 40);
  LineHorizontalRoom.drawBox(20, 20, 255, 0);
  //RoomPageText.drawBox(highlightColor, highlightColor, 100, 10);
  RoomPageText.drawTextLeft(imgText, robotoLight28, 0);
  RoomPageImage.drawImage(roomPageImage);

  //Page 5 ----------------------------------------------------------------------------------------------------------------------------------

  Page5Title = new Object(
    width/2 - 20,
    height * 4.08 - index,
    800,
    300);

  rectMode(CENTER);
  Page5Title.drawTextCenter(page5Title, robotoLightItalic50, 40);
  rectMode(CORNER);


  float page5Parralax = 1; //Set to 1 to disable parralax
  int page5Offset = 0; //If parralax is disabled set to 0


  for (int i = 0; i < Page5Top.length; i++) {
    Page5Top[i] = new Object(100 + (i * 600), height * 4.04 - index * page5Parralax + page5Offset, 450, 100); //Creates all objects in a sequential order for easy organisation.
    Page5TopText[i] = new Object(100+ (i * 600), height * 4.11 - index * page5Parralax + page5Offset, 450, 350);
    LineHorizontalTop[i] = new Object(175 + (i * 600), height * 4.11 - index * page5Parralax + page5Offset, 300, 1);

    Page5Top[i].drawTextCenter(page5Top[i], robotoLight50, selectionColor);
    Page5TopText[i].drawTextLeft(page5TopText[i], robotoLight28, 0);
    LineHorizontalTop[i].drawBox(20, 20, 255, 0);
    //Page5Top[i].drawBox(highlightColor, highlightColor, 100, 10);
    //Page5TopText[i].drawBox(highlightColor, highlightColor, 100, 10);
  }

  for (int i = 0; i < Page5Bottom.length; i++) {
    Page5Bottom[i] = new Object(100 + (i * 600), height * 4.45 - index * page5Parralax + page5Offset, 450, 100); //Creates all objects in a sequential order for easy organisation.
    Page5BottomText[i] = new Object(100 + (i * 600), height * 4.52 - index * page5Parralax + page5Offset, 450, 350);
    LineHorizontalBottom[i] = new Object(175 + (i * 600), height * 4.52 - index * page5Parralax + page5Offset, 300, 1);

    LineHorizontalBottom[i].drawBox(20, 20, 255, 0);
    Page5Bottom[i].drawTextCenter(page5Bottom[i], robotoLight50, selectionColor);
    Page5BottomText[i].drawTextLeft(page5BottomText[i], robotoLight28, 0);
    //Page5Top[i].drawBox(highlightColor, highlightColor, 100, 10);
    //Page5BottomText[i].drawBox(highlightColor, highlightColor, 100, 10);
  }

  //Page 6 ----------------------------------------------------------------------------------------------------------------------------------

  Page6Title = new Object(
    width/2 - 20,
    height * 5.14 - index,
    800,
    300);

  rectMode(CENTER);
  Page6Title.drawTextCenter(page6Title, robotoLightItalic50, 40);
  rectMode(CORNER);


  float page6Parralax = 1; //Set to 1 to disable parralax
  int page6Offset = 0; //If parralax is disabled set to 0

  for (int i = 0; i < Page6Top.length; i++) {
    Page6Top[i] = new Object(100 + (i * 600), height * 5.1 - index * page6Parralax + page6Offset, 450, 100); //Creates all objects in a sequential order for easy organisation.
    Page6TopText[i] = new Object(100+ (i * 600), height * 5.17 - index * page6Parralax + page6Offset, 450, 600);
    LineHorizontalTop6[i] = new Object(175 + (i * 600), height * 5.17 - index * page6Parralax + page6Offset, 300, 1);

    Page6Top[i].drawTextCenter(page6Titles[i], robotoLight50, selectionColor);
    Page6TopText[i].drawTextLeft(page6Text[i], robotoLight28, 0);
    LineHorizontalTop6[i].drawBox(20, 20, 255, 0);
    //Page5Top[i].drawBox(highlightColor, highlightColor, 100, 10);
    //Page5TopText[i].drawBox(highlightColor, highlightColor, 100, 10);
  }


  ResetButton = new Object(
    width / 2 - 125,
    height * 6 - index - 180,
    250,
    60);

  ResetButton.drawBox(selectionColor, highlightColor, 100, 10);
  ResetButton.drawTextCenter(button, robotoLightItalic40, 0);
  ResetButton.mouseOver();
  ResetButton.clickObject();
  ResetButton.scrollToPointUP(0);


  //Draws scroll distance indicator to the right of the screen.
  fill(selectionColor);
  noStroke();
  rect(width - 10, -margin, 10, margin / 1 + index * 1.25 / pages.length);

  //Debugging
  println(index);
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

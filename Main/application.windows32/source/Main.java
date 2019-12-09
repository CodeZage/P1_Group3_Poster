import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Main extends PApplet {

int index = 0; //Tracks current position of the viewport
float margin = 4;
boolean mouseClick = false;

int highlightColor = 0xff1FCCFF;
int selectionColor = 0xff0A9AC4;

Page[] pages = new Page[5];

//Button/Box/Line Objects
Object FrontPageBox;
Object ResetButton;

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

Object[] Page5Top = new Object[3];
Object[] Page5TopText = new Object[3];
Object[] LineHorizontalTop = new Object[3];

Object[] Page5Bottom = new Object[3];
Object[] Page5BottomText = new Object[3];
Object[] LineHorizontalBottom = new Object[3];


public void setup() {
  
  frameRate(60);
  

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
  robotoLightItalic80 = createFont("Roboto-LightItalic.ttf", 80);


  frontPageImage = loadImage("Images/frontImage.png");
  vrPageImage = loadImage("Images/vrImage.png");
  roomPageImage = loadImage("Images/roomImage.jpg");
}

public void draw() {

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

  FrontPageImage.drawImage(frontPageImage);

  FrontPageBox.drawBox(0, 0, 70, 0);

  FrontPageText1.drawTextCenter(frontPageText1, robotoLight180, 230);
  FrontPageText2.drawTextCenter(frontPageText2, robotoLight180, 230);
  FrontPageText3.drawTextCenter(frontPageText3, robotoLight80, 230);

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
  VrPageText.drawBox(highlightColor, highlightColor, 100, 10);
  VrPageText.drawTextLeft(vrText, robotoLight28, 0);

  //Page 3 ----------------------------------------------------------------------------------------------------------------------------------

  VrTitle = new Object(
    -500, 
    height * 2.12f - index, 
    width, 
    300);

  FirstAidTitle = new Object(
    480, 
    height * 2.12f - index, 
    width, 
    300);

  ListLineVertical = new Object(
    width/2 - 1, 
    height * 2.3f - index, 
    1, 
    height * 0.6f);

  ListLineHorizontalVr = new Object(
    200, 
    height * 2.25f - index, 
    540, 
    1);

  ListLineHorizontalFirstaid = new Object(
    width - 740, 
    height * 2.25f - index, 
    540, 
    1);

  for (int i = 0; i < VrList.length; i++) {
    VrList[i] = new Object(0, height * 2.35f - index + i * 120, width/2, 100); //Creates all objects in a sequential order for easy organisation.
    VrList[i].drawTextCenter(vrListText[i], robotoThin80, 0);
    //VrList[i].drawBox(highlightColor, highlightColor, 100, 10);
  }

  for (int i = 0; i < FirstAidList.length; i++) {
    FirstAidList[i] = new Object(width/2, height * 2.35f - index + i * 120, width/2, 100); //Creates all objects in a sequential order for easy organisation.
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

  Citation = new Object(
    width/2, 
    height * 3.06f - index, 
    800, 
    300);

  CitationName = new Object(
    width/2, 
    height * 3.09f - index, 
    600, 
    300);

  rectMode(CENTER);
  Citation.drawTextCenter(citationText, robotoLightItalic40, 70);
  rectMode(CORNER);
  CitationName.drawTextCenter(citationNameText, robotoLight40, 70);


  //Page 4 ----------------------------------------------------------------------------------------------------------------------------------
  float page4Parralax = 1.8f; //Set to 1 to disable parralax 
  int page4Offset = 2600; //If parralax is disabled set to 0

  RoomPageTitle = new Object(
    margin * 10, 
    height * 3.05f - index * page4Parralax + page4Offset, 
    width / 2 - 120, 
    height / 2); 

  RoomPageSubTitle = new Object(
    margin * 10, 
    height * 3.15f - index * page4Parralax + page4Offset, 
    width / 2 - 120, 
    height / 2); 

  LineHorizontalRoom = new Object(
    margin * 21, 
    height * 3.25f - index * page4Parralax + page4Offset, 
    540, 
    1);

  RoomPageText = new Object(
    margin * 10, 
    height * 3.25f - index * page4Parralax + page4Offset, 
    width / 2 - 120, 
    height-400); 

  RoomPageImage = new Object(
    width / 2 - margin * 2, 
    height * 3.25f + margin * 2 - index, 
    width / 2 - margin * 10, 
    height / 2 - margin * 2); 

  RoomPageTitle.drawTextLeft(roomTitleText, robotoLight80, selectionColor);
  RoomPageSubTitle.drawTextLeft(roomSubTitleText, robotoLightItalic40, 40);
  LineHorizontalRoom.drawBox(20, 20, 255, 0);
  //RoomPageText.drawBox(highlightColor, highlightColor, 100, 10);
  RoomPageText.drawTextLeft(imgText, robotoLight28, 0);
  RoomPageImage.drawImage(roomPageImage);

  //Page 5 ----------------------------------------------------------------------------------------------------------------------------------
  float page5Parralax = 1; //Set to 1 to disable parralax 
  int page5Offset = 0; //If parralax is disabled set to 0

  for (int i = 0; i < Page5Top.length; i++) {
    Page5Top[i] = new Object(100 + (i * 600), height * 4.04f - index * page5Parralax + page5Offset, 450, 100); //Creates all objects in a sequential order for easy organisation.
    Page5TopText[i] = new Object(100+ (i * 600), height * 4.11f - index * page5Parralax + page5Offset, 450, 350);
    LineHorizontalTop[i] = new Object(175 + (i * 600), height * 4.11f - index * page5Parralax + page5Offset, 300, 1);

    Page5Top[i].drawTextCenter(page5Top[i], robotoLight50, selectionColor);
    Page5TopText[i].drawTextLeft(page5TopText[i], robotoLight28, 0);
    LineHorizontalTop[i].drawBox(20, 20, 255, 0);
    //Page5Top[i].drawBox(highlightColor, highlightColor, 100, 10);
    //Page5TopText[i].drawBox(highlightColor, highlightColor, 100, 10);
  } 

  for (int i = 0; i < Page5Bottom.length; i++) {
    Page5Bottom[i] = new Object(100 + (i * 600), height * 4.45f - index * page5Parralax + page5Offset, 450, 100); //Creates all objects in a sequential order for easy organisation.
    Page5BottomText[i] = new Object(100+ (i * 600), height * 4.52f - index * page5Parralax + page5Offset, 450, 350);
    LineHorizontalBottom[i] = new Object(175 + (i * 600), height * 4.52f - index * page5Parralax + page5Offset, 300, 1);

    LineHorizontalBottom[i].drawBox(20, 20, 255, 0);
    Page5Bottom[i].drawTextCenter(page5Bottom[i], robotoLight50, selectionColor);
    Page5BottomText[i].drawTextLeft(page5BottomText[i], robotoLight28, 0);
    //Page5Top[i].drawBox(highlightColor, highlightColor, 100, 10);
    //Page5BottomText[i].drawBox(highlightColor, highlightColor, 100, 10);
  } 

  ResetButton = new Object(
    width / 2 - 125, 
    height * 5 - index - 70, 
    250, 
    60);

  ResetButton.drawBox(selectionColor, highlightColor, 100, 10);
  ResetButton.drawTextCenter(button, robotoLightItalic40, 0);
  ResetButton.mouseOver();
  ResetButton.clickObject();
  ResetButton.scrollToPoint(0);


  //Draws scroll distance indicator to the right of the screen. 
  fill(selectionColor);
  noStroke();
  rect(width - margin, -margin, 5, margin / 1 + index * 1.25f / pages.length);

  //Debugging
  println(index);
}



public void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e < 0 && index > 0) {
    index -= 54;
  }
  if (e > 0 && index < height*(pages.length-1)) {
    index += 54;
  }
}
PImage frontPageImage;
PImage roomPageImage; 
PImage vrPageImage;
//Class for making objects such as buttons, images and text on the screen
class Object {

  float posX;
  float posY;
  float sizeX;
  float sizeY;

  Object(float x1, float y1, float x2, float y2) {
    posX = x1;
    posY = y1;
    sizeX = x2;
    sizeY = y2;
  }

  boolean over;
  boolean under;

  public void clickObject() {
    println(mouseClick);
    if (mouseOver() == true && mousePressed) {
      mouseClick = true;
    }
  }

  public void scrollToPoint(float point) {
    if (mouseClick == true) {
      if (index > point && index > point + 54) {
        index -= 216;
      }
      if (index > point && index < point + 54) {
        index -= 1;
      } else if (index == point) {
        mouseClick = false;
      }
    }
  }
  
  public void drawLine(float strokeSize) {
    strokeWeight(strokeSize);
    line(posX, posY, sizeX, sizeY);
    noStroke();
  }

  public void drawObject(PShape vector) {
    shape(vector, posX, posY, sizeX, sizeY);
  }

  public void drawTextLeft(String text, PFont font, int col) {
    textAlign(LEFT);
    fill(col);
    textFont(font);
    text(text, posX + 40, posY + sizeY / 10 - 20, sizeX - 40, sizeY + 20);
  }

  public void drawTextCenter(String text, PFont font, int col) {
    textAlign(CENTER);
    fill(col);
    textFont(font);
    text(text, posX, posY + sizeY / 10, sizeX, sizeY);
  }

  public void drawImage(PImage image) {
    image(image, posX, posY, sizeX, sizeY);
  }

  public void drawBox(int selectionCol, int baseCol, float alpha, float curve) {
    if (mouseOver() == true) {
      fill(selectionCol, alpha);
    }
    if (mouseOver() == false) {
      fill(baseCol, alpha);
    }
    noStroke();
    rect(posX, posY, sizeX, sizeY, curve);
  }

  public boolean mouseOver() {
    if (mouseX > posX && mouseX < posX + sizeX && mouseY > posY && mouseY < posY + sizeY) {
      return true;
    } else return false;
  }
}
//This class is for drawing the background pages of the document

class Page {

  float posX;
  float posY;
  float sizeX;
  float sizeY;
  
  Page(float x1, float y1, float x2, float y2) {

    posX = x1;
    posY = y1;
    sizeX = x2;
    sizeY = y2;
  }

  int mouseOverHighlight  = (90);

  public void drawPage() {
    rect(posX, posY-index, sizeX, sizeY);
  }
}
PFont robotoBlack20;
PFont robotoBlack40;
PFont robotoBlack80;
PFont robotoBlack180;

PFont robotoThin22;
PFont robotoThin40;
PFont robotoThin80;
PFont robotoThin120;
PFont robotoThin180;

PFont robotoLight28;
PFont robotoLight40;
PFont robotoLight50;
PFont robotoLight60;
PFont robotoLight80;
PFont robotoLight180;

PFont robotoLightItalic40;
PFont robotoLightItalic80;

PFont robotoBlackItalic;
PFont robotoBold;
PFont robotoBoldItalic;
PFont robotoItalic;
PFont robotoLightItalic; 
PFont robotoMedium; 
PFont robotoMediumItalic;
PFont robotoRegular;
PFont robotThinItalic;

//------------------------------------------------------------------------------------------------------------------------------------

String frontPageText1 = "Førstehælp";
String frontPageText2 = "I Virtual Reality";
String frontPageText3 = "\"Det Starter med dig\"";

String vrText = "Virtual reality (VR) er en teknologi, der transporterer brugeren ind i en virtuel virkelighed. Det gør man oftest med et VR-headset, der består af et display til hvert øje, og som lukke rresten af verden ude. Udover display teknologien, indeholder et VR-headset næsten også altid en form for tracking-teknologi, der skal holde styr på, hvordan brugeren bevæger sig. Denne form for teknologi kan også komme i kontrollerne. På den måde kan man både gestikulere og bevæge sig rundt i den virtuelle verden.";

String vrTitleText = "Virtual Reality";
String firstaidTitleText = "Normal Førstehjælp";

String[] vrListText = new String[4]; 
{
  vrListText[0] = "Virkelig 1-til-1 oplævelse";
  vrListText[1] = "Inkludere sanserne";
  vrListText[2] = "Samtidig evaluering";
  vrListText[3] = "Haptisk feedback";
}

String[] firstaidListText = new String[4]; 
{
  firstaidListText[0] = "Urealistiske omgivelser";
  firstaidListText[1] = "Mangel på reel feedback";
  firstaidListText[2] = "Hovedsageligt teoretisk";
  firstaidListText[3] = "Dårlig genkaldelse";
}

String citationText = "\"Hvis hjernen kan genkende nogle af de scenarier som den har været i, så vil den faktisk kunne agere ud fra det\"";
String citationNameText = "- Teis Krag"; 

String roomTitleText = "Koncept";
String roomSubTitleText = "En mulighed for fremtiden";
String imgText = "Evnen til at udføre førstehjælp er en utrolig vigtig færdighed. At udføre korrekt førstehjælp er tit den største forudsætning for overlevelse i tilfælde af uheld. Evnen til at udføre førsthælp i krisesituationer kommer alle i samfundet til gavn. I Danmark er den mest hyppige førstehælpstræning modtaget under optagelsen af et kørekort. Virtual Reality (VR) tilbyder en stor mængde muligheder for at lære mere effektivt. Der er beviser for at VR can tillade folk at reagere og agere realistisk is simlered scenarier. Det betyder at VR giver dig mulighed for at lære førstehælp i simulerede situationer der mere ligner dem man eventuelt kan havne i den virkelige verden. Der er også beviser for at danskere er nogen af de mest uforberedte på at udøve førstehjælp. Det kan VR teknologi hjælpe med at rette op på. Fremtiden for undervisning i simulerede virtuelle omgivelser ser lys ud.";



String[] page5Top = new String[3]; 
{
  page5Top[0] = "Lyd";
  page5Top[1] = "Sanser";
  page5Top[2] = "Haptisk Feedback";
}

String[] page5Bottom = new String[3]; 
{
  page5Bottom[0] = "Grafik";
  page5Bottom[1] = "Læring";
  page5Bottom[2] = "Room-scale";
}

String[] page5TopText = new String[3]; 
{

  page5TopText[0] = "Vejen til at opnå fuld realisme i en virtuel oplvelse kan kune gøres ved hælp af realistisk lyd. Et realistisk krisescenarie har mange forskellige lyde man skal være opmærksom på. Derfor er korrekt gengivelse utrolig vigtig.";
  page5TopText[1] = "Mennesket har en stor mængde af forskellige sanser. Der er beviser for at brugen af flere sanser under læring giver bedre tibagekaldelse af materialet. Et VR system kan derfor tvinge os til at bruge flere sanser.";
  page5TopText[2] = "Berørings sansen kan stimuleres i et virtuelt miljø igennem haptisk feedback. Specielt udstyr som HaptX hansken kan stimulere denne sans ved hjælp af specielt bygget teknologi.";
}

String[] page5BottomText = new String[3]; 
{

  page5BottomText[0] = "En vigtig faktor for at fremkalde realistisk opførsel i VR er at man befinder sig i realistiske omgivelser. Innovationer i grafik-teknologi som real-time raytracing og 3D scanninger af virkelige objecter baner vejen for ultra-realistiske virtuelle miljøer.";
  page5BottomText[1] = "VR giver muligheden for at lære fra scenarier der aldrig ville være mulige eller sikrer at frestille i virkeligheden. Det skaber muligheder for at teste brugernes handlingsevner i stress-situation såsom krig, ulykker, naturkatastrofer og lign.";
  page5BottomText[2] = "Room-scale VR tillader brugeren at fysiske bevæge sig i et rum og få deres bevægelser reflekteret inde i en virtuel verden. Disse systemer tillader for en lang højere grad af indlevelse.";
}

String button = "Tilbage";
  public void settings() {  size(1920, 1080);  smooth(8); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

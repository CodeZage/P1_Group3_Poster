int index = 0;
String b = "Hello World";

void setup() {

  size(500, 500);
  surface.setResizable(true);
}

void draw() {

  background(230);
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, width-25, height-25);
  fill(#2FE8E3);
  rect(width /2 - 60, height /2 - 250 - index, 400, 400);
  textSize(32);
  fill(0);
  text("dank", width/2, height/2 - index*2);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e < 0 && index > 0) {
    index -= 50;
  }
  if (e > 0) {
    index += 50;
  }
}

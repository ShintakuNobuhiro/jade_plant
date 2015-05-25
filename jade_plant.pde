int sum = 0;
Tree tree;

PFont meiryo;

int h;
int posX, posY;
int sizeX;

void setup() {
  size(640, 480);
  smooth();
  sizeX = 6;
  meiryo = loadFont("MeiryoUI.vlw");
}

void draw() {
  background(sky());
  fill(textColor());
  textSize(32);
  textAlign(RIGHT);
  textFont(meiryo);
  text(sum, width-10, 40);
  textSize(24);
  textAlign(LEFT);
  text(date(), 10, 40);

  h = sum / 10;
  posX = width/2;
  posY = height - h/2;
  rectMode(CENTER);
  fill(100, 60, 0);
  rect(posX, posY, sizeX, h);
  println(posX+ " " + posY);
}

void keyPressed() {
  if (key == 'h') {
    sum += 10;
  }
}

String date() {
  int year = year();
  int month = month();
  int day = day();
  int h = hour();
  int m = minute();
  int s = second();
  return(year+"年"+nf(month, 2)+"月"+nf(day, 2)+"日"+nf(h, 2)+":"+nf(m, 2)+":"+nf(s, 2));
}

color sky() {
  //夜
  if (hour() <= 4 || hour() >= 19) {
    return color(10, 0, 50);
  }
  else if (hour() >= 5 && hour() <= 10) {
    return (color(210, 230, 255));
  }
  else if (hour() >= 11 && hour() <= 16) {
    return (color(150, 200, 230));
  }
  else if (hour() == 17 || hour() == 18) {
    return (color(230, 150, 100));
  } else {
    return (color(0,0,0));
  }
}

color textColor() {
  //夜
  if (hour() <= 4 || hour() >= 19) {
    return color(255);
  }
  else {
    return (color(0));
  }
}


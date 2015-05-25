int sum = 0;
//Tree tree;

PFont meiryo;

int h; //高さ
int posX, posY; //四角の位置
int sizeX;
color s, t;

void setup() {
  size(640, 480); 
  smooth();
  sizeX = 6; //四角の横幅
  meiryo = loadFont("MeiryoUI.vlw"); //MeiryoUI 32ポイント
  s = skyColor();
  t = textColor();
}

void draw() {
  //毎時0分0秒に色を更新(負荷軽減策)、突然の変更には対応出来ない？
  if (minute() == 0 && second() == 0) {
    s = skyColor();
    t = textColor();
  }

  background(s);//空の色
  fill(t);//テキスト色

  //合計額の表示
  textSize(32);
  textAlign(RIGHT);
  textFont(meiryo);
  text(sum + "円", width-10, 40);

  //日付時刻の表示
  textSize(24);
  textAlign(LEFT);
  text(date(), 10, 40);

  //四角の表示
  h = sum / 10;
  posX = width/2;
  posY = height - h/2;
  rectMode(CENTER);
  fill(100, 60, 0);
  rect(posX, posY, sizeX, h);
}

//キー押下時
void keyPressed() {
  //hが押されたら
  if (key == 'h') {
    sum += 10; //金額を10増やす
  }
}

//左上日付時刻文字列
String date() {
  int year = year();
  int month = month();
  int day = day();
  int h = hour();
  int m = minute();
  int s = second();
  return(year+"年"+nf(month, 2)+"月"+nf(day, 2)+"日"+nf(h, 2)+":"+nf(m, 2)+":"+nf(s, 2));
}

color skyColor() {
  //夜
  if (hour() <= 4 || hour() >= 19) {
    return color(10, 0, 50);
  }
  //朝
  else if (hour() >= 5 && hour() <= 10) {
    return (color(210, 230, 255));
  }
  //昼
  else if (hour() >= 11 && hour() <= 16) {
    return (color(150, 200, 230));
  }
  //夕方 17～18時
  else {
    return (color(230, 150, 100));
  }
}

//テキスト色決定
color textColor() {
  //夜
  if (hour() <= 4 || hour() >= 19) {
    return color(255);
  }
  //朝～夕方
  else {
    return (color(0));
  }
}


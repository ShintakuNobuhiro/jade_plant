//Processing 1.5.1

import ddf.minim.*;//マイクライブラリのインポート
Minim minim;
AudioInput audioIn;

PImage img[] = new PImage[6]; //画像配列。やり方はhttp://www.d-improvement.jp/learning/processing/2011-b/04.html参照。
PFont meiryo;

float level; //マイク音量値
float resLevel = 100; //マイク反応音量閾値

boolean responce = false; //マイク入力がリセット後あったか
boolean gameover = false; //ゲームオーバー状態か

int resTime = 0; //マイク初回入力時の起動からの秒数
int currentTime; //起動してからの秒数
int changeTime = 10; //背景色等変更秒数
int sum = 0; //現在の成長値

void setup() {
  size(640, 480); 
  smooth();
  meiryo = loadFont("MeiryoUI.vlw"); //MeiryoUI 32ポイント
  //画像の配列読み込み(0～4成長,5枯れ)
  for (int i=0;i<img.length;i++) {
    img[i] = loadImage("tree"+ i +".png");
  }
  //マイク処理
  minim = new Minim(this);
  audioIn = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {

  currentTime = millis()/1000;
  level = audioIn.mix.level()*1000; //マイク音量

  background(skyColor());
  fill(textColor());//テキスト色
  println(currentTime-resTime);
  imageMode(CORNER);
  float imgScale;
  float imgSizeX, imgSizeY;

  //ゲームオーバ処理
  if (currentTime-resTime >= 5 && responce == true) {
    gameover = true;
  }
  
  tint(skyColor());
  //枯れ
  if (gameover == true) {
    sum = 0;
    imgScale = 1;
    imgSizeX = img[5].width*imgScale;
    imgSizeY = img[5].height*imgScale;
    image(img[5], (width-imgSizeX)/2, height-imgSizeY, imgSizeX, imgSizeY);
  } 
  else 
    if (sum >= 2000) { // 2000円超えてたら一番でかいの
    imgScale = 1;
    imgSizeX = img[4].width*imgScale;
    imgSizeY = img[4].height*imgScale;
    image(img[4], (width-imgSizeX)/2, height-imgSizeY, imgSizeX, imgSizeY);
  } 
  else 
    if (sum >= 1000) { //1000円超
    imgScale = 1;
    imgSizeX = img[3].width*imgScale;
    imgSizeY = img[3].height*imgScale;
    image(img[3], (width-imgSizeX)/2, height-imgSizeY+30, imgSizeX, imgSizeY);
  } 
  else 
    if (sum >= 500) { //500円超
    imgScale = 0.9;
    imgSizeX = img[2].width*imgScale;
    imgSizeY = img[2].height*imgScale;
    image(img[2], (width-imgSizeX)/2, height-imgSizeY+30, imgSizeX, imgSizeY);
  } 
  else 
    if (sum >= 300) { //300円超
    imgScale = 0.75;
    imgSizeX = img[1].width*imgScale;
    imgSizeY = img[1].height*imgScale;
    image(img[1], (width-imgSizeX)/2, height-imgSizeY+30, imgSizeX, imgSizeY);
  } 
  else { //初期
    imgScale = 0.33;
    imgSizeX = img[0].width*imgScale;
    imgSizeY = img[0].height*imgScale;
    image(img[0], (width-imgSizeX)/2, height-imgSizeY+10, imgSizeX, imgSizeY);
  }

  //マイク反応
  if (level >= resLevel && gameover == false) {
    sum += 5;
    responce = true;
    resTime = currentTime;
  }
  
  //合計額の表示
  textSize(32);
  textAlign(RIGHT);
  textFont(meiryo);
  text(sum, width-10, 40);

  //日付時刻の表示
  textSize(24);
  textAlign(LEFT);
  text(date(), 10, 40);
}

//キー押下時
void keyPressed() {
  //sが押されたらいつでもリセット
  if (key == 's') {
    sum = 0;
    responce = false;
    resTime = 0;
    gameover = false;
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
  int temp = ( (millis()/1000) / changeTime ) % 4;
  //夜
  if (temp == 0) {
    return color(30, 30, 100);
  }
  //朝
  else if (temp == 1) {
    return (color(210, 230, 255));
  }
  //昼
  else if (temp == 2) {
    return (color(150, 200, 230));
  }
  //夕方 17～18時
  else {
    return (color(230, 150, 100));
  }
}

//テキスト色決定
color textColor() {
  int temp = ( (millis()/1000) / changeTime ) % 4;
  //夜
  if (temp == 0) {
    return color(255);
  }
  //朝～夕方
  else {
    return (color(0));
  }
}


// jack morrison | shape game | 3 sept 2024
int x, y, score, tx, ty, tw, speed;

void setup() {// setup runs once at start
  size(500, 500);
  background(255, 255, 0);
  x = 100;
  y = 100;
  score = 0;
  tx = width/2;
  ty = height/2;
  tw = 100;
  speed = 0;
}

void draw() { // draw runs on a 30fps loop
  frameRate(speed + 20);
  background(55, 125, 50);
  target();

  fill(255, 255, 255);
  stroke(100);
  ellipse(x, y, 20, 20);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y = y - 10;
    } else if (key == 's' || key == 'S') {
      y = y + 10;
    } else if (key == 'a' || key == 'A') {
      x = x - 10;
    } else if (key == 'd' || key == 'D') {
      x = x + 10;
    }
  }
  score();

  //if (x < 1) {
  //  x = width;
  //}
  //if (x> width-1) {
  //  x = 1;
  //}
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y = y - 10;
    } else if (keyCode == DOWN) {
      y = y + 10;
    } else if (keyCode == LEFT) {
      x = x - 10;
    } else if (keyCode == RIGHT) {
      x = x + 10;
    }
  }
}

void score() {
  rectMode(CENTER);
  fill(128, 128);
  rect(width/2, 20, width, 40);
  fill(0);
  textSize(30);
  text("score:" + score, 20, 30);
  if (dist(x, y, tx, ty)<20) {
    tx = int(random(width));
    ty = int(random(height));
    score = score +10;
    tw = 100;
    speed = speed + 1;
  }
}

void target() {
  rect(tx, ty, tw, tw);
  rectMode (CENTER);
  fill (0, 0, 0);
  tw = tw - 1;
  if (tw < 2) {
    gameOver();
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over!", width/2, height/2);
  noLoop();
}

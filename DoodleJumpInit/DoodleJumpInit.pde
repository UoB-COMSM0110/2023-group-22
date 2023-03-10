PImage background_img;
PImage doodler_img;
PImage doodler_reverse_img;
PImage spring_img;
PImage jetpack_img;
PImage jetpack_effect_img;
PImage jetpack_effect_alt_img;
int W = 400;
int H = 600;
Doodler doodler;
ArrayList <Platform> platforms;
float gap;
int score=0;

void settings(){
  size(W, H);
}

void setup(){
  background(63, 204, 218);
  doodler = new Doodler(W,H);
  doodler_img = loadImage("doodle.png");
  doodler_reverse_img = loadImage("doodle_alternate.png");
  background_img = loadImage("background.jpg");
  spring_img = loadImage("spring.png");
  jetpack_img = loadImage("jetpack.png");
  jetpack_effect_img = loadImage("jetpack_effect.png");
  jetpack_effect_alt_img = loadImage("jetpack_effect_alt.png");
  int platformCount = 6;
  gap = H/platformCount;
  platforms = new ArrayList<>();
  for (int i=0;i<platformCount;i++){
    platforms.add(new Platform(random(W),H-(gap*i)));
  }
}

void draw(){
  image(background_img, 0, 0);
  if (doodler.velocity > 10) {
    noLoop();
    gameOver();
  }
  else{
    translate(0, H/ 2 - doodler.y);
  }
  push();
  fill(255, 255, 255);
  textSize(30);
  textAlign(CENTER);
  text(score, width/2, doodler.y - 250);
  pop();

  doodler.draw();
  doodler.update(platforms);
  for (Platform p:platforms){
    if (p.disappear==false){
      p.draw();
    }
    if(p.equipment != null){
      p.equipment.draw();
    }
  }
  if (doodler.y < platforms.get(platforms.size()-1).y + 200) {
    platforms.add(new Platform(random(width), platforms.get(platforms.size()-1).y - gap));
  }
  if (platforms.get(0).y > doodler.y + 400) {
      platforms.remove(0);
      score++;
    }
}

void gameOver(){
  image(background_img, 0, 0);;
  textSize(30);
  textAlign(CENTER);
  fill(0);
  text("You scored "+score, W/2, W/2);
  textSize(25);
  text("Hit space to play again", W/2, H/ 2 + 100);
}

void keyPressed(){
  if (keyCode==LEFT && doodler.x_velocity > -5){
    doodler.x_velocity -= 4;
    if(doodler.img_direction != -1){
      doodler.img_direction = doodler.img_direction * -1;
    }
  }
  if (keyCode==RIGHT && doodler.x_velocity < 5){
    doodler.x_velocity += 4;
    if(doodler.img_direction != 1){
      doodler.img_direction = doodler.img_direction * -1;
    }
  }
  if (keyCode==' '){
    loop();
    setup();
  }
}
void keyReleased(){
  if (keyCode == LEFT){
    doodler.x_velocity = 0;
  }
  if (keyCode == RIGHT){
    doodler.x_velocity = 0;
  }
}
  

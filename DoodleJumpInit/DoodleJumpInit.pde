PImage background_img;
PImage doodler_img;
PImage doodler_reverse_img;
PImage spring_img;
PImage jetpack_img;
PImage jetpack_effect_img;
PImage jetpack_effect_alt_img;
PFont font;
int W = 400;
int H = 600;
Doodler doodler;
StartPage startPage;
Doodler startPageDoodler;
ArrayList <Platform> platforms;
ArrayList <Platform> startPagePlatforms;
float gap;
int score=0;
int state=0;
int npc=0;

void settings(){
  size(W, H);
}

void setup(){
  background(63, 204, 218);
  doodler = new Doodler(W,H);
  startPage = new StartPage(W,H);
  startPageDoodler = new Doodler(W,H,180,280);
  background_img = loadImage("background.jpg");
  spring_img = loadImage("spring.png");
  jetpack_img = loadImage("jetpack.png");
  jetpack_effect_img = loadImage("jetpack_effect.png");
  jetpack_effect_alt_img = loadImage("jetpack_effect_alt.png");
  int platformCount = 6;
  gap = H/platformCount;
  platforms = new ArrayList<>();
  for (int i=0;i<platformCount;i++){
    platforms.add(new Platform(random(W-60),H-(gap*i)));
  }
  startPagePlatforms = new ArrayList<>();
  startPagePlatforms.add(new Platform(165,335,0));
  startPagePlatforms.add(new Platform(70,250,1));
  startPagePlatforms.add(new Platform(270,275,2));
  startPagePlatforms.add(new Platform(230,210,3));
  
  font = createFont("Comic Sans MS", 25);
}

void draw(){
  if (state==0){
    image(background_img, 0, 0);
    startPage.draw();
    npc=startPage.currentChoice;
    startPageDoodler.draw(npc);
    startPageDoodler.jumpForce= -8;
    startPageDoodler.gravity= 0.5;
    startPageDoodler.img_direction=-1;
    startPageDoodler.update(startPagePlatforms);
    for (Platform p:startPagePlatforms){
      if (p.disappear==false){
        p.draw();
      if(p.equipment != null){
        p.equipment.draw();
    }
    }
    if (startPage.gameStart==true){
      state=1;
    }
    }
  }
  else{
    image(background_img, 0, 0);
  if (doodler.velocity > 10) {
    noLoop();
    gameOver();
  }
  else{
    translate(0, H/ 2 - doodler.y);
  }
  push();
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text(score, width/2, doodler.y - 250);
  pop();

  doodler.draw(npc);
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
    platforms.add(new Platform(random(W-60), platforms.get(platforms.size()-1).y - gap));
  }
  if (platforms.get(0).y > doodler.y + 400) {
      platforms.remove(0);
      score++;
    }
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

void mouseClicked(){
  startPage.mouseClicked();
}
  

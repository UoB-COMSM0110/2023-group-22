PImage background_img;
PImage pauseBackgroundImg;
PImage pauseButton;
PFont font;
int W = 400;
int H = 600;

ArrayList <Doodler> doodler;
StartPage startPage;
Doodler startPageDoodler;
PauseWindow pause;
GameOver gameOver;
Settings setting;

ArrayList <Platform> platforms;
ArrayList <Platform> startPagePlatforms;
float gap;
int score;
int gameState=0;
int playerCount;
int npc=0;
int npc2=0;
boolean pauseState=false;
boolean settingState = false;
int platformCount;
boolean isGameOver = false;
//To prevent two continuous broken platform
int prevBrokenPlatform=0;

void settings(){
  size(W, H);
}

void setup(){
  background(255);
  font = createFont("Comic Sans MS", 25);

  doodler = new ArrayList<>();
  doodler.add(new Doodler(W,H));
  doodler.add(new Doodler(W,H));
  startPage = new StartPage(W,H);
  startPageDoodler = new Doodler(W,H,180,280);
  pause = new PauseWindow();
  gameOver = new GameOver();

  background_img = loadImage("background.jpg");
  pauseBackgroundImg = loadImage("black.jpg");
  pauseButton = loadImage("pause-button.png");

  score = 0;
  platformCount = 6;
  gap = H/platformCount;
  platforms = new ArrayList<>();
  //To prevent Doodler fall immediately when game started
  platforms.add(new Platform(W/2,(float) H/2+100,0));

  for (int i=0;i<platformCount-1;i++){
    if ((H/2+100)==H-(gap*i)){
      continue;
    }
    platforms.add(new Platform(random(W-60),H-(gap*i)));
  }

  //Platforms for start page
  startPagePlatforms = new ArrayList<>();
  startPagePlatforms.add(new Platform(165,335,0));
  startPagePlatforms.add(new Platform(70,250,1));
  startPagePlatforms.add(new Platform(270,275,2));
  startPagePlatforms.add(new Platform(230,210,3));

  //settings
  setting = new Settings();

}

void draw(){
  if (gameState==0){
    pauseState = false;
    image(background_img, 0, 0);
    startPage.draw();
    npc = startPage.currentChoice;
    if(npc != 2){
      npc2 = npc + 1;
    }
    startPageDoodler.draw(npc);
    startPageDoodler.jumpForce= -8;
    startPageDoodler.gravity = 0.5;
    startPageDoodler.img_direction = -1;
    startPageDoodler.update(startPagePlatforms);
    for (Platform p:startPagePlatforms){
      if (p.disappear==false){
        p.draw();
      }
      if(p.equipment != null){
        p.equipment.draw();
      }
    }
    if (settingState == true){
      tint(255,128);
      image(pauseBackgroundImg, 0, 0);
      noTint();
      setting.draw();  
    }
    if (startPage.gameStart==true){
        gameState=1;
    }
  }
  //pause window
  else if (pauseState){
    startPage.gameStart=false;
    pause.draw(width/2, 100);
    pauseState = pause.pauseState;
  }
  else{
    //main game
    image(background_img, 0, 0);
    pushMatrix();
    if (doodler.get(0).velocity > 10) {
      noLoop();
      isGameOver = true;
      gameOver.draw();
    }
    else{
      translate(0, H/ 2 - doodler.get(0).y);
    }
    push();
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text(score, width/2, doodler.get(0).y - 250);
    pause.pauseButton(width-60, doodler.get(0).y - 280);
    pauseState = pause.pauseState;
    pop();
    
    doodler.get(0).draw(npc);
    //doodler.draw(npc);
    doodler.get(0).update(platforms);
    if(setting.playerNumber != 0){
      doodler.get(1).draw(npc2);
      doodler.get(1).update(platforms);
    }
    for (Platform p:platforms){
      if (p.disappear==false){
        p.draw();
      }
      if(p.equipment != null){
        p.equipment.draw();
      }
    }
    popMatrix();
    if (doodler.get(0).y < platforms.get(platforms.size()-1).y + 200) {
      platforms.add(new Platform(random(W-60), platforms.get(platforms.size()-1).y - gap));
    }
    if (platforms.get(0).y > doodler.get(0).y + 400) {
        platforms.remove(0);
        score++;
      }
      if (pauseState){
        tint(255,128);
        image(pauseBackgroundImg, 0, 0);
        noTint();
    }
  }
}


void keyPressed(){
  if (keyCode==LEFT && doodler.get(0).x_velocity > -5){
    doodler.get(0).x_velocity -= 4;
    if(doodler.get(0).img_direction != -1){
      doodler.get(0).img_direction = doodler.get(0).img_direction * -1;
    }
  }
  if (keyCode==RIGHT && doodler.get(0).x_velocity < 5){
    doodler.get(0).x_velocity += 4;
    if(doodler.get(0).img_direction != 1){
      doodler.get(0).img_direction = doodler.get(0).img_direction * -1;
    }
  }
  if(key == 'a' && doodler.get(1).x_velocity > -5){
    doodler.get(1).x_velocity -= 4;
    if(doodler.get(1).img_direction != -1){
      doodler.get(1).img_direction = doodler.get(1).img_direction * -1;
    }
  }
  if (key == 'd' && doodler.get(1).x_velocity < 5){
    doodler.get(1).x_velocity += 4;
    if(doodler.get(1).img_direction != 1){
      doodler.get(1).img_direction = doodler.get(1).img_direction * -1;
    }
  }
  
  if (keyCode==' ' && isGameOver == true){
    isGameOver = false;
    int temp = setting.playerNumber;
    setup();
    setting.playerNumber = temp;
    loop();
  }
}

void keyReleased(){
  if (keyCode == LEFT){
    doodler.get(0).x_velocity = 0;
  }
  if (keyCode == RIGHT){
    doodler.get(0).x_velocity = 0;
  }
  if (key == 'a'){
    doodler.get(1).x_velocity = 0;
  }
  if (key == 'd'){
    doodler.get(1).x_velocity = 0;
  }
}

void mouseClicked(){
  if (gameState==0){
    setting.mouseClicked();
    startPage.mouseClicked();
  }
  if (gameState==1){
    pause.mouseClicked();
  }
  if ((isGameOver) && (mouseX>=W*0.36) && (mouseX<= W*0.36 + 115) && (mouseY>= H*0.47) && (mouseY<= H*0.47 +45)){
    gameState = 0;
    setup();
    loop();
  }
}
  

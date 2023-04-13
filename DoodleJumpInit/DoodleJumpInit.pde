PImage background_img;
PImage pauseBackgroundImg;
PImage pauseButton;
PImage spike;
PFont font;
int W = 400;
int H = 600;

Doodler doodler;
Doodler doodler_down;

StartPage startPage;
Doodler startPageDoodler;
PauseWindow pause;
GameOver gameOver;
Settings setting;
Help help;

ArrayList <Platform> platforms;
ArrayList <Platform> platforms_down;
ArrayList <Platform> startPagePlatforms;
float gap;
int score;
int gameState=0;
int npc=0;
boolean pauseState=false;
boolean settingState = false;
boolean helpState = false;
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

  doodler = new Doodler(W,H);
  doodler_down = new Doodler(W,H);
  startPage = new StartPage(W,H);
  startPageDoodler = new Doodler(W,H,180,280);
  pause = new PauseWindow();
  gameOver = new GameOver();

  background_img = loadImage("background.jpg");
  pauseBackgroundImg = loadImage("black.jpg");
  pauseButton = loadImage("pause-button.png");
  spike = loadImage("top.png");

  score = 0;
  platformCount = 6;
  gap = H/platformCount;
  platforms = new ArrayList<>();
  platforms_down = new ArrayList<>();
  //To prevent Doodler fall immediately when game started
  platforms.add(new Platform(W/2,(float) H/2+100,0));
  platforms_down.add(new Platform(W/2,(float) H/2+100,0));


  for (int i=0;i<platformCount-1;i++){
    if (Math.abs(H/2+100)-(H-(gap*i))<0.0001){
      continue;
    }
    platforms.add(new Platform(random(W-60),H-(gap*i)));
    platforms_down.add(new Platform(random(W-60),H-(gap*i)));

  }

  //Platforms for start page
  startPagePlatforms = new ArrayList<>();
  startPagePlatforms.add(new Platform(165,335,0));
  startPagePlatforms.add(new Platform(70,250,1));
  startPagePlatforms.add(new Platform(270,275,2));
  startPagePlatforms.add(new Platform(230,210,3));

  //settings
  setting = new Settings();
  //instructions
  help = new Help();

}

void draw(){
  if (gameState==0){
    pauseState = false;
    image(background_img, 0, 0);
    startPage.draw();
    npc = startPage.currentChoice;
    startPageDoodler.draw(npc);
    startPageDoodler.jumpForce= -5;
    startPageDoodler.gravity = 0.2;
    startPageDoodler.img_direction = -1;
    startPageDoodler.update(startPagePlatforms);
    for (Platform p:startPagePlatforms){
      p.draw();
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
    if (helpState == true){
      tint(255,128);
      image(pauseBackgroundImg, 0, 0);
      noTint();
      help.draw(); 
    }
    if (startPage.gameStart == true){
        gameState = 1;
    }
  }
  //pause window
  else if (pauseState){
    startPage.gameStart=false;
    pause.draw(width/2, 100);
    pauseState = pause.pauseState;
  }
  //down stairs mode
  else if (gameState==2){
    image(background_img, 0, 0);
    image(spike,0,0,600,30);
    pushMatrix();
    if (doodler_down.y>600 || doodler_down.y<10) {
      noLoop();
      isGameOver = true;
      gameOver.draw();
      return;
    }
    doodler_down.draw(npc);
    doodler_down.update(platforms_down,true);
    if (frameCount%15==0){
      platforms_down.add(0,new Platform(random(W-60),(float) platforms_down.get(0).y+gap));
    }
    System.out.println("====================================");
    for (Platform p:platforms_down){
      System.out.println(p.y);
      p.draw();
    }
    System.out.println("====================================");

    push();
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text(score, width-45, 80);
    pause.pauseButton(width-60, 20);
    pauseState = pause.pauseState;
    pop();
    popMatrix();
    if (platforms_down.get(platforms_down.size()-1).y < -100) {
        platforms_down.remove(platforms_down.size()-1);
        score++;
    }
    if (pauseState){
      tint(255,128);
      image(pauseBackgroundImg, 0, 0);
      noTint();
    }

  }
  else{
    //main game
    image(background_img, 0, 0);
    pushMatrix();
    if (doodler.velocity > 10) {
      noLoop();
      isGameOver = true;
      gameOver.draw();
      return;
    }
    else{
      translate(0, H/ 2 - doodler.y);
    }
    push();
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text(score, width/2, doodler.y - 250);
    pause.pauseButton(width-60, doodler.y - 280);
    pauseState = pause.pauseState;
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
    popMatrix();
    if (doodler.y < platforms.get(platforms.size()-1).y + 200) {
      platforms.add(new Platform(random(W-60), platforms.get(platforms.size()-1).y - gap));
    }
    if (platforms.get(0).y > doodler.y + 400) {
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
  if (keyCode==LEFT && doodler.x_velocity > -5){
    if (gameState==1){
      doodler.x_velocity -= 4;
      if(doodler.img_direction != -1){
        doodler.img_direction = doodler.img_direction * -1;
      }
    }
    if (gameState==2){
      doodler_down.x_velocity -= 4;
      if(doodler_down.img_direction != -1){
        doodler_down.img_direction = doodler_down.img_direction * -1;
      }
    }
    
  }
  if (keyCode==RIGHT && doodler.x_velocity < 5){
    if (gameState==1){
      doodler.x_velocity += 4;
      if(doodler.img_direction != 1){
        doodler.img_direction = doodler.img_direction * -1;
      }
    }
    if (gameState==2){
      doodler_down.x_velocity += 4;
      if(doodler_down.img_direction != 1){
        doodler_down.img_direction = doodler_down.img_direction * -1;
      }
    }
  }
  if (keyCode==ENTER){
    System.out.println("gameState "+gameState);
    if(gameState==1){
      gameState=2;
    }
    else{
      gameState=1;
    }
  }
  if (keyCode==' ' && isGameOver == true){
    isGameOver = false;
    loop();
    setup();
  }
}

void keyReleased(){
  if (keyCode == LEFT){
    if (gameState==1){
      doodler.x_velocity = 0;
    }
    else if (gameState==2){
      doodler_down.x_velocity = 0;
    }
  }
  if (keyCode == RIGHT){
    if (gameState==1){
      doodler.x_velocity = 0;
    }
    else if (gameState==2){
      doodler_down.x_velocity = 0;
    }
  }
}

void mouseClicked(){
  if (gameState==0){
    setting.mouseClicked();
    startPage.mouseClicked();
    help.mouseClicked();
  }
  if (gameState==1 || gameState==2){
    pause.mouseClicked();
  }
  if ((isGameOver) && (mouseX>=W*0.36) && (mouseX<= W*0.36 + 115) && (mouseY>= H*0.47) && (mouseY<= H*0.47 +45)){
    startPage.gameStart = false;
    isGameOver = false;
    gameState = 0;
    loop();
    setup();
  }
}
  

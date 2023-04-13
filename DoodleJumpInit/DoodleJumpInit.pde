PImage background_img;
PImage pauseBackgroundImg;
PImage pauseButton;
PImage spike;
PImage doodleFallWord;
PFont font;
int W = 400;
int H = 600;

// Doodler doodler;
ArrayList <Doodler> doodler;
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
ArrayList <Monster> monsters;

float gap;
int score;
// 0:start page , 1:one player main game , 2: down stairs, 3: 2 players mode
int gameState=0;

int npc=0;
int npc2=0;

boolean pauseState=false;
boolean settingState = false;
boolean helpState = false;
int platformCount;
boolean isGameOver = false;

//monster usage
boolean addNewMonster = true;
int initialTime;
int interval = 5000;

//To prevent two continuous broken platform
int prevBrokenPlatform=0;
int sosPlatformCount=0;
int addedScore=0;

//Downstairs usage
int downFrameStart=0;
int downGameFrameStart=0;
int downScore=0;
boolean countDownState=false;

int winner;


void settings(){
  size(W, H);
}

void setup(){
  background(255);
  font = createFont("Comic Sans MS", 25);

  // doodler = new Doodler(W,H);
  doodler = new ArrayList<>();
  doodler.add(new Doodler(W,H));
  doodler.add(new Doodler(W,H));
  doodler_down = new Doodler(W,H);
  startPage = new StartPage(W,H);
  startPageDoodler = new Doodler(W,H,180,280);
  pause = new PauseWindow();
  gameOver = new GameOver();

  background_img = loadImage("background.jpg");
  pauseBackgroundImg = loadImage("black.jpg");
  pauseButton = loadImage("pause-button.png");
  spike = loadImage("top.png");
  doodleFallWord = loadImage("watchout.jpg");

  initialTime = millis();
  monsters = new ArrayList<>();

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
  startPagePlatforms.add(new Platform(230,210,0));

  //settings
  setting = new Settings();
  //instructions
  help = new Help();

  prevBrokenPlatform=0;
  sosPlatformCount=0;
  addedScore=0;

  //Downstairs usage
  downFrameStart=0;
  downGameFrameStart=0;
  downScore=0;
  countDownState=false;

}

void draw(){
  if (gameState==0){
    pauseState = false;
    image(background_img, 0, 0);
    startPage.draw();
    npc = startPage.currentChoice;
    //TODO 
    if(npc != 2){
      npc2 = npc + 1;
    }

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
        gameState = setting.getPlayerNumber()==0?1:3;
    }
  }
  //pause window
  else if (pauseState){
    startPage.gameStart=false;
    pause.draw(width/2, 100);
    pauseState = pause.pauseState;
  }
  else if (countDownState){
    image(background_img, 0, 0);
    tint(255,200);
    image(pauseBackgroundImg,0,0);
    noTint();
    image(doodleFallWord, 0, 100);
    if (frameCount-downFrameStart>=45){
      if (gameState==1){
        gameState=2;
        downGameFrameStart = frameCount;
        doodler_down = new Doodler(W,H);
        platforms_down = new ArrayList<>();
        platforms_down.add(new Platform(W/2,(float) H/2+100,0));
        for (int i=0;i<platformCount-1;i++){
          if (Math.abs(H/2+100)-(H-(gap*i))<0.0001){
            continue;
          }
          platforms_down.add(new Platform(random(W-60),H-(gap*i)));
        }
      }
      else{
        gameState=1;
      }
      countDownState = false;
    }
  }
  //down stairs mode
  else if (gameState==2){
    image(background_img, 0, 0);
    image(spike,0,0,600,30);
    if (frameCount-downGameFrameStart>=180){
      countDownState = true;
      downFrameStart = frameCount;
    }
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
    // System.out.println("====================================");
    for (Platform p:platforms_down){
      // System.out.println(p.y);
      p.draw();
    }
    // System.out.println("====================================");

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
    if (score%30==0 && score!=addedScore){
      sosPlatformCount+=1;
      addedScore=score;
    }
    if (pauseState){
      tint(255,128);
      image(pauseBackgroundImg, 0, 0);
      noTint();
    }

  }
  //two player mode
  else if (gameState==3){
    image(background_img, 0, 0);
    pushMatrix();
    if (doodler.get(0).velocity > 10 || doodler.get(1).velocity > 10 || doodler.get(0).doodler_dissapear || doodler.get(1).doodler_dissapear) {
      noLoop();
      if (doodler.get(0).velocity > 10 || doodler.get(0).doodler_dissapear){
        winner = 1;
      }
      else{
        winner = 0;
      }
      isGameOver = true;
      gameOver.draw();
      return;
    }
    else{
      if (doodler.get(0).y<=doodler.get(1).y){
        translate(0, H/ 2 - doodler.get(0).y);
      }
      else{
        translate(0, H/ 2 - doodler.get(1).y);
      }
    }
    push();
    // fill(0);
    // textSize(30);
    // textAlign(CENTER);
    // text(score, width/2, doodler.get(0).y - 250);
    if (doodler.get(0).y<=doodler.get(1).y){
      pause.pauseButton(width-60, doodler.get(0).y - 280);
      pauseState = pause.pauseState;
    }
    else{
      pause.pauseButton(width-60, doodler.get(1).y - 280);
      pauseState = pause.pauseState;
    }
    pop();

    if (!doodler.get(0).doodler_dissapear){
      doodler.get(0).draw(npc);
    }
    if (!doodler.get(1).doodler_dissapear){
      doodler.get(1).draw(npc2);
    }
    doodler.get(0).update(platforms);
    doodler.get(0).updateMonster(monsters);
    doodler.get(1).update(platforms);
    doodler.get(1).updateMonster(monsters);
    
    for (Platform p:platforms){
      if (p.disappear==false){
        p.draw();
      }
      if(p.equipment != null){
        p.equipment.draw();
      }
    }

    if(monsters.size() != 0){
      for(Monster m:monsters){
        m.draw();
      }
    }
    popMatrix();

    if (doodler.get(0).y<=doodler.get(1).y){
      if (doodler.get(0).y < platforms.get(platforms.size()-1).y + 200) {
        platforms.add(new Platform(random(W-60), platforms.get(platforms.size()-1).y - gap));
      }
      if (platforms.get(0).y > doodler.get(0).y + 400) {
        platforms.remove(0);
        // score++;
      }
    }
    else{
      if (doodler.get(1).y < platforms.get(platforms.size()-1).y + 200) {
        platforms.add(new Platform(random(W-60), platforms.get(platforms.size()-1).y - gap));
      }
      if (platforms.get(1).y > doodler.get(1).y + 400) {
        platforms.remove(1);
        // score++;
      }

    }
    if (millis() - initialTime > interval){
      if(monsters.size() > 0){
        monsters.remove(0);
      }
      if (doodler.get(0).y<=doodler.get(1).y){
        monsters.add(new Monster(random(W-60), doodler.get(0).y - 400));
      }
      else{
        monsters.add(new Monster(random(W-60), doodler.get(1).y - 400));
      }
      initialTime = millis();
      interval = (int) random(3000,10000);
    }
    if (pauseState){
      tint(255,128);
      image(pauseBackgroundImg, 0, 0);
      noTint();
    }
  }
  else{
    //one player main game
    image(background_img, 0, 0);
    if (setting.getDifficulty()==2 && score%10==0 && score!=downScore){
      countDownState = true;
      downFrameStart = frameCount;
      return;
    }
    pushMatrix();
    if (doodler.get(0).velocity > 10 || doodler.get(0).doodler_dissapear) {
      noLoop();
      isGameOver = true;
      gameOver.draw();
      return;
    }
    else{
      translate(0, H/ 2 - doodler.get(0).y);
    }
    push();
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text(score, width/2, doodler.get(0).y - 250);
    text("x", 90, doodler.get(0).y - 250);
    text(sosPlatformCount, 110, doodler.get(0).y - 250);
    push();
    fill (195, 180, 212);
    stroke(0);
    strokeWeight(1.2);
    rect(25,doodler.get(0).y - 270,50,20, 2);
    pop();
    pause.pauseButton(width-60, doodler.get(0).y - 280);
    pauseState = pause.pauseState;
    pop();
  
    doodler.get(0).draw(npc);
    doodler.get(0).update(platforms);
    if (setting.getDifficulty()!=0){
      doodler.get(0).updateMonster(monsters);
      if(monsters.size() != 0){
        for(Monster m:monsters){
          m.draw();
        }
      }
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
    if (score%30==0 && score!=addedScore){
      sosPlatformCount+=1;
      addedScore=score;
    }
    if (setting.getDifficulty()!=0 && (millis() - initialTime > interval)){
      if(monsters.size() > 0){
        monsters.remove(0);
      }
      monsters.add(new Monster(random(W-60), doodler.get(0).y - 400));
      initialTime = millis();
      interval = (int) random(3000,10000);
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
    if (gameState==1 || gameState==3){
      doodler.get(0).x_velocity -= 4;
      if(doodler.get(0).img_direction != -1){
        doodler.get(0).img_direction = doodler.get(0).img_direction * -1;
      }
    }
    if (gameState==2){
      doodler_down.x_velocity -= 4;
      if(doodler_down.img_direction != -1){
        doodler_down.img_direction = doodler_down.img_direction * -1;
      }
    }
    
  }
  if (keyCode==RIGHT && doodler.get(0).x_velocity < 5){
    if (gameState==1 || gameState==3){
      doodler.get(0).x_velocity += 4;
      if(doodler.get(0).img_direction != 1){
        doodler.get(0).img_direction = doodler.get(0).img_direction * -1;
      }
    }
    if (gameState==2){
      doodler_down.x_velocity += 4;
      if(doodler_down.img_direction != 1){
        doodler_down.img_direction = doodler_down.img_direction * -1;
      }
    }
  }
  //two players mode
  if (gameState==3){
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
  }

  // if (keyCode==ENTER){
  //   System.out.println("gameState "+gameState);
  //   if(gameState==1){
  //     gameState=2;
  //   }
  //   else{
  //     gameState=1;
  //   }
  // }
  if (keyCode==' ' && isGameOver == true){
    int tmpDiff = setting.getDifficulty();
    int tmpPlayers = setting.getPlayerNumber();
    isGameOver = false;
    setup();
    setting.setDifficulty(tmpDiff);
    setting.setPlayerNumber(tmpPlayers);
    loop();
  }
}

void keyReleased(){
  if (keyCode == LEFT){
    if (gameState==1 || gameState==3){
      doodler.get(0).x_velocity = 0;
    }
    else if (gameState==2){
      doodler_down.x_velocity = 0;
    }
  }
  if (keyCode == RIGHT){
    if (gameState==1 || gameState==3){
      doodler.get(0).x_velocity = 0;
    }
    else if (gameState==2){
      doodler_down.x_velocity = 0;
    }
  }
  if (gameState==3){
    if (key == 'a'){
    doodler.get(1).x_velocity = 0;
    }
    if (key == 'd'){
      doodler.get(1).x_velocity = 0;
    }
  }
  if (gameState==1){
    if (keyCode=='Z'){
      if (sosPlatformCount > 0){
        platforms.add(0,new Platform(doodler.get(0).x, doodler.get(0).y+60,3));
        sosPlatformCount--;
      }
    }
  }

}

void mouseClicked(){
  if (gameState==0){
    setting.mouseClicked();
    startPage.mouseClicked();
    help.mouseClicked();
  }
  if (gameState==1 || gameState==2 || gameState==3){
    pause.mouseClicked();
  }
  if ((isGameOver) && (mouseX>=W*0.36) && (mouseX<= W*0.36 + 115) && (mouseY>= H*0.47) && (mouseY<= H*0.47 +45)){
    startPage.gameStart = false;
    gameState = 0;
    int tmpDiff = setting.getDifficulty();
    int tmpPlayers = setting.getPlayerNumber();
    isGameOver = false;
    setup();
    setting.setDifficulty(tmpDiff);
    setting.setPlayerNumber(tmpPlayers);
    loop();
  }
}
  

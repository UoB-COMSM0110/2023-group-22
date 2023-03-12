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
  int platformCount = 6;
  gap = H/platformCount;
  platforms = new ArrayList<>();
  for (int i=0;i<platformCount;i++){
    platforms.add(new Platform(random(W),H-(gap*i)));
  }
}

void draw(){
<<<<<<< Updated upstream
  background(63, 204, 218);
=======
  //start_page show
  if (state==0){
    image(background_img, 0, 0);


    if(startPage.isDoublePlayer == false){
      startPage.draw();

      npc=startPage.currentChoice;
      startPageDoodler.draw(npc);
      startPageDoodler.jumpForce= -8;
      startPageDoodler.gravity= 0.5;
      startPageDoodler.img_direction=-1;
      startPageDoodler.update(startPagePlatforms);    
    }else{
      startPage.currentChoice = 3;
      startPage.draw();
      startPageDoodler.draw(3);
      startPageDoodler.jumpForce= -8;
      startPageDoodler.gravity= 0.5;
      startPageDoodler.img_direction=-1;
      startPageDoodler.update(startPagePlatforms);
    }


    for (Platform p:startPagePlatforms){
      if (p.disappear==false){
        p.draw();
        if(p.equipment != null){
          p.equipment.draw();
        }
      }
      if (startPage.gameStart==true){
        //swtich to live game mode.
        state=1;
      }
    }
  }
  else{
    image(background_img, 0, 0);
>>>>>>> Stashed changes
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
    p.draw();
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
  background(251, 169, 194);
  textSize(30);
  textAlign(CENTER);
  fill(0);
  text("You scored "+score, W/2, W/2);
  textSize(25);
  text("Hit space to play again", W/2, H/ 2 + 100);
}

void keyPressed(){
  if (key==' '){
    doodler.jump();
  }
  if (keyCode==LEFT){
    doodler.moveLeft();
  }
  if (keyCode==RIGHT){
    doodler.moveRight();
  }
}

  

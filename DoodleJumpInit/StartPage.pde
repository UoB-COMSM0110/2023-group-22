public class StartPage{
  public int currentChoice;
  PImage settingIconImg;
  PImage char0Img;
  PImage char1Img;
  PImage char2Img;
  PImage title0Img;
  PImage title1Img;
  PImage startButtonImg;
  private int W;
  private int H;
  private int npcLeft = 0;
  private int npcRight = 2;
  private float imageWidth = 150;
  private float imageHeight = 105;
  public boolean gameStart = false;
  public boolean isDoublePlayer = true; //new flag
  
  public StartPage(int w,int h){
    this.W=w;
    this.H=h;
  }

  
  private void title(){
    title0Img = loadImage("0_Doodle.png");
    image(title0Img,W/2-175/2,60,175,47); 
    title0Img = loadImage("1_Jump.png");
    image(title0Img,125,110,132,47);
  }

  private void settingIcon(){
    settingIconImg = loadImage("setting.png");
    image(settingIconImg,315,-10,100,100);
  }
  
  private void char1(){
    char1Img = loadImage("astronaut_doodle.png");
    image(char1Img, W*1/6-imageWidth/3, H*0.62, imageWidth, imageHeight);
  }
  
  private void char0(){
    char0Img = loadImage("doodle.png");
    image(char0Img, W*3/6-imageWidth/2, H*0.62, imageWidth, imageHeight);
  }
  
  private void char2(){
    char2Img = loadImage("ninja_doodle_alternate.png");
    image(char2Img, W*5/6-imageWidth/1.5, H*0.62, imageWidth, imageHeight);
  }
  private void singlePlayerChoose(){
    char1();
    tint(255,128);
    char0();
    char2();
    noTint();
  }
  private void doublePlayerChoose(){
    textFont(font);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("Player2", W*0.8, H*0.80);
    text("Player1", W*0.2, H*0.80);

  }
  private void startButton(){
    startButtonImg = loadImage("start_button.png");
    image(startButtonImg, W*3/6-imageWidth/2, H*5/6, imageWidth, imageHeight);
  }
  
  
  public void draw(){
    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    rect(W*0.36, H*0.85, 115, 45, 10);
    
    //START text 
    fill(80, 50, 0);
    textFont(font);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("START", W*0.505, H*0.88);
    
    //startButton();
    settingIcon();
    title();
    //FIXME
    if(isDoublePlayer){
      doublePlayerChoose();
    }else{
      singlePlayerChoose();
    }

  }
   
   void mouseClicked(){
    if(isDoublePlayer){
      if ((mouseX>=W*1/6-imageWidth/3) && (mouseX<=(W*1/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
        npcLeft = (npcLeft + 1) % 3;
      }
      else if ((mouseX>=W*5/6-imageWidth/1.5) && (mouseX<=(W*5/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
        npcRight = (npcRight + 1) % 3;
      }
      else if ((mouseX>=W*0.36) && (mouseX<= W*0.36 + 120) && (mouseY>= H*0.85) && (mouseY<= H*0.85 +45)){
        gameStart=true;
      }
    }else{
      if ((mouseX>=W*1/6-imageWidth/3) && (mouseX<=(W*1/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
        currentChoice=1;
      }
      else if ((mouseX>=W*5/6-imageWidth/1.5) && (mouseX<=(W*5/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
        currentChoice=2;
      }
      else if ((mouseX>=W*3/6-imageWidth/2) && (mouseX<=(W*3/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
        currentChoice=0;
      }
      else if ((mouseX>=W*0.36) && (mouseX<= W*0.36 + 120) && (mouseY>= H*0.85) && (mouseY<= H*0.85 +45)){
        gameStart=true;
      }
    }
 }
    
}
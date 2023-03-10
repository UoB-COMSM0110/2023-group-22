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
  private float imageWidth = 150;
  private float imageHeight = 105;
  public boolean gameStart = false;
  
  public StartPage(int w,int h){
    this.W=w;
    this.H=h;
  }
  
  private void title(){
    title0Img = loadImage("0_Doodle.png");
    image(title0Img,W/2-175/2,70,175,47); 
    title0Img = loadImage("1_Jump.png");
    image(title0Img,125,120,132,47);
  }

  private void settingIcon(){
    settingIconImg = loadImage("setting.png");
    image(settingIconImg,-5,5,100,100);
  }
  
  private void char1(){
    char1Img = loadImage("astronaut_doodle.png");
    image(char1Img, W*1/6-imageWidth/2, H*4/6, imageWidth, imageHeight);
  }
  
  private void char0(){
    char0Img = loadImage("doodle.png");
    image(char0Img, W*3/6-imageWidth/2, H*4/6, imageWidth, imageHeight);
  }
  
  private void char2(){
    char2Img = loadImage("ninja_doodle_alternate.png");
    image(char2Img, W*5/6-imageWidth/2, H*4/6, imageWidth, imageHeight);
  }
  
  private void startButton(){
    startButtonImg = loadImage("start_button.png");
    image(startButtonImg, W*3/6-imageWidth/2, H*5/6, imageWidth, imageHeight);
  }
  
  
  public void draw(){
    startButton();
    settingIcon();
    title();
    if (currentChoice == 1){
      char1();
      tint(255,128);
      char0();
      char2();
      noTint();
      currentChoice=1;
    }
    else if(currentChoice == 2){
      char2();
      tint(255,128);
      char0();
      char1();
      noTint();
    }
    else{
      char0();
      tint(255,128);
      char1();
      char2();
      noTint();
    }
  }
   
   void mouseClicked(){
    if ((mouseX>=W*1/6-imageWidth/2) && (mouseX<=(W*1/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
      System.out.println("c1");
      System.out.println("c1");
      currentChoice=1;
    }
    else if ((mouseX>=W*5/6-imageWidth/2) && (mouseX<=(W*5/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
      System.out.println("c2");
      System.out.println("c2");
      currentChoice=2;
    }
    else if ((mouseX>=W*3/6-imageWidth/2) && (mouseX<=(W*3/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
      currentChoice=0;
    }
    if ((mouseX>=W*3/6-imageWidth/2) && (mouseX<=(W*3/6-imageWidth/2+imageWidth)) && (mouseY>= H*5/6) && (mouseY<= H*5/6+imageHeight)){
      gameStart=true;
    }   
 }
    
}

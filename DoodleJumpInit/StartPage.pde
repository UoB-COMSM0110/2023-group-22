public class StartPage{
  public int currentChoice;
  PImage settingIconImg;
  PImage char0Img;
  PImage char1Img;
  PImage char2Img;
<<<<<<< HEAD
  PImage char3Img;
  PImage char4Img;
=======
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00
  PImage title0Img;
  PImage title1Img;
  PImage startButtonImg;
  private int W;
  private int H;
  private float imageWidth = 150;
  private float imageHeight = 105;
  public boolean gameStart = false;
<<<<<<< HEAD
  public boolean isDoublePlayer = true;
=======
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00
  
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
<<<<<<< HEAD

  private void char0(){
    char0Img = loadImage("doodle.png");
    image(char0Img, W*3/6-imageWidth/2, H*0.62, imageWidth, imageHeight);
  }
=======
  
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00
  private void char1(){
    char1Img = loadImage("astronaut_doodle.png");
    image(char1Img, W*1/6-imageWidth/3, H*0.62, imageWidth, imageHeight);
  }
  
<<<<<<< HEAD
=======
  private void char0(){
    char0Img = loadImage("doodle.png");
    image(char0Img, W*3/6-imageWidth/2, H*0.62, imageWidth, imageHeight);
  }
  
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00
  private void char2(){
    char2Img = loadImage("ninja_doodle_alternate.png");
    image(char2Img, W*5/6-imageWidth/1.5, H*0.62, imageWidth, imageHeight);
  }
<<<<<<< HEAD
  private void char3(){
    char4Img = loadImage("astronaut_doodle.png");
    image(char4Img, W*5/6-imageWidth/1.5, H*0.6, imageWidth, imageHeight);
    char3Img = loadImage("ninja_doodle_alternate.png");
    image(char3Img, W*2/6-imageWidth/1.5, H*0.6, imageWidth, imageHeight);
    
  }
=======
  
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00
  private void startButton(){
    startButtonImg = loadImage("start_button.png");
    image(startButtonImg, W*3/6-imageWidth/2, H*5/6, imageWidth, imageHeight);
  }
  
  
  public void draw(){
    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    rect(W*0.36, H*0.85, 115, 45, 10);
    
    fill(80, 50, 0);
    textFont(font);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("START", W*0.505, H*0.88);
    
    //startButton();
    settingIcon();
    title();
    if (currentChoice == 1){
      char1();
      tint(255,128);
      char0();
      char2();
      noTint();
      currentChoice=1;
<<<<<<< HEAD
    }else if(currentChoice == 2){
=======
    }
    else if(currentChoice == 2){
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00
      char2();
      tint(255,128);
      char0();
      char1();
      noTint();
<<<<<<< HEAD
    }else if(currentChoice == 3){
      char3();
      tint(255,128);
      // char0();
      // char1();
      noTint();
    }else{
=======
    }
    else{
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00
      char0();
      tint(255,128);
      char1();
      char2();
      noTint();
    }
  }
   
   void mouseClicked(){
    if ((mouseX>=W*1/6-imageWidth/3) && (mouseX<=(W*1/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
<<<<<<< HEAD
      System.out.println("c1");
      System.out.println("c1");
      currentChoice=1;
    }
    else if ((mouseX>=W*5/6-imageWidth/1.5) && (mouseX<=(W*5/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
      System.out.println("c2");
      System.out.println("c2");
=======
      currentChoice=1;
    }
    else if ((mouseX>=W*5/6-imageWidth/1.5) && (mouseX<=(W*5/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00
      currentChoice=2;
    }
    else if ((mouseX>=W*3/6-imageWidth/2) && (mouseX<=(W*3/6-imageWidth/2+imageWidth)) && (mouseY>= H*4/6) && (mouseY<= H*4/6+imageHeight)){
      currentChoice=0;
    }
    if ((mouseX>=W*0.36) && (mouseX<= W*0.36 + 120) && (mouseY>= H*0.85) && (mouseY<= H*0.85 +45)){
      gameStart=true;
    }   
 }
    
<<<<<<< HEAD
}
=======
}
>>>>>>> 744058936ac09bb0716c6a25ef9f6420916c9c00

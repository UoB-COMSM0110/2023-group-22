public class StartPage{
    
    public int currentChoice;
    PImage settingIconImg = loadImage("setting.png");
    PImage char0Img = loadImage("doodle.png");
    PImage char1Img = loadImage("astronaut_doodle.png");
    PImage char2Img = loadImage("ninja_doodle_alternate.png");
    PImage title0Img = loadImage("0_Doodle.png");
    PImage title1Img = loadImage("1_Jump.png");
    PImage startButtonImg;
    private int W;
    private int H;
    private float imageWidth = 150;
    private float imageHeight = 105;
    public boolean gameStart = false;
    public boolean settingPage = false;
    
    public StartPage(int w,int h) {
        this.W = w;
        this.H = h;
        // startButtonImg = loadImage("start_button.png");
    }
    
    public int getCurrentChoice() {
        return currentChoice;
    }
    
    private void title() {
        image(title0Img,W / 2 - 175 / 2,60,175,47); 
        image(title1Img,125,110,132,47);
        }
    
    private void settingIcon() {
        image(settingIconImg,315, -10, 100, 100);
        }
    
    private void char0() {
        image(char0Img, W * 3 / 6 - imageWidth / 2, H * 0.62, imageWidth, imageHeight);
        }
    
    private void char1() {
        image(char1Img, W * 1 / 6 - imageWidth / 3, H * 0.62, imageWidth, imageHeight);
        }
    
    private void char2() {
        image(char2Img, W * 5 / 6 - imageWidth / 1.5, H * 0.62, imageWidth, imageHeight);
        }
    
    private void startButton() {
        fill(229, 226, 194);
        stroke(0);
        strokeWeight(1.2);
        rect(W * 0.36, H * 0.85, 115, 45, 10);
        
        fill(80, 50, 0);
        textFont(font);
        textSize(25);
        textAlign(CENTER, CENTER);
        text("START", W * 0.505, H * 0.88);
        // image(startButtonImg, W*3/6-imageWidth/2, H*5/6, imageWidth, imageHeight);
        }

    private void helpButton(){ 
        fill(0);
        textSize(35);
        text("\u24d8", 35, 33);
    }
    
    private void chooseMe(){
        // Draw the dialog icon
        fill(229, 226, 194);
        ellipse(60, 335, 90, 40);
        ellipse(35, 370, 25, 20);
        ellipse(45, 390, 10, 10);

        //text
        fill(80, 50, 0);
        textFont(font);
        textSize(15);
        textAlign(CENTER, CENTER);
        if (currentChoice == 1){
            text("Great!", 60, 332);
        }else{
            text("Choose Me!", 60, 332);
        } 
    }
    
    public void draw() {
        startButton();
        settingIcon();
        helpButton();
        chooseMe();
        title();
        if (currentChoice == 1) {
            char1();
            tint(255,128);
            char0();
            char2();
            noTint();
            }
        else if (currentChoice == 2) {
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
    
    void mouseClicked() {
        if ((mouseX >=  W * 1 / 6 - imageWidth / 3) && (mouseX<= (W * 1 / 6 - imageWidth / 2 + imageWidth)) && (mouseY>= H * 4 / 6) && (mouseY<= H * 4 / 6 + imageHeight)) {
            currentChoice = 1;
            }
        else if ((mouseX >=  W * 5 / 6 - imageWidth / 1.5) &&  (mouseX<= (W * 5 / 6 - imageWidth / 2 + imageWidth)) && (mouseY>= H * 4 / 6) && (mouseY<= H * 4 / 6 + imageHeight)) {
            currentChoice = 2;
            }
        else if ((mouseX >=  W * 3 / 6 - imageWidth / 2) && (mouseX<= (W * 3 / 6 - imageWidth / 2 + imageWidth)) && (mouseY>= H * 4 / 6) && (mouseY<= H * 4 / 6 + imageHeight)) {
            currentChoice = 0;
            }
        if ((mouseX >=  W * 0.36) && (mouseX<= W * 0.36 + 120) && (mouseY>= H * 0.85) && (mouseY<= H * 0.85 + 45)) {
            gameStart = true;
            }
        if ((mouseX >= 315) && (mouseX<= 315 + 100) && (mouseY>= - 10) && (mouseY<= -10 + 100)) {
            settingState = true;
            }
        if ((mouseX >= 35 - 20) && (mouseX<= 35 + 20) && (mouseY>= 33 - 20) && (mouseY<= 33 + 20)) {
            helpState = true;
            }
    }
}

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
    public int playerNumber = 0;
    public int player1 = 0;
    public int player2 = 0;
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
            fill(250, 213, 207);
            stroke(0);
            strokeWeight(1.2);
            rect(W * 0.36, H * 0.85, 115, 45, 10);
        
            fill(80, 50, 0);
            textFont(font);
            textSize(25);
            textAlign(CENTER, CENTER);
            text("START", W * 0.505, H * 0.88);
    }

    private void helpButton(){ 
        fill(0);
        textSize(35);
        text("\u24d8", 35, 33);
    }
    
    private void chooseMe(){
        // Draw the dialog icon
        fill(242, 227, 143);
        ellipse(60, 335, 120, 40);
        ellipse(35, 370, 25, 20);
        ellipse(45, 390, 10, 10);

        //text
        fill(80, 50, 0);
        textFont(font);
        textSize(15);
        textAlign(CENTER, CENTER);
        text("Click to choose!", 60, 332);    
    }
    
    public void draw() {
        startButton();
        settingIcon();
        helpButton();
        chooseMe();
        title();
        if (playerNumber == 0){
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
        }else if (playerNumber == 1){
            fill(80, 50, 0);
            textFont(font);
            textSize(15);
            textAlign(CENTER, CENTER);
            if (player1 == 0 && player2 == 0) {
            text("Choose 2 players to start!", width/2, 565);
            tint(255,128);
            char1();
            char2();
            char0();
            noTint();
            }
        else if (player1 == 1 && player2 == 0) {
            text("Choose 2 players to start!", width/2, 565);
            char2();
            text("player1", 305, 480);
            tint(255,128);
            char0();
            char1();
            noTint();
            }
        else if (player1 == 2 && player2 == 0) {
            text("Choose 2 players to start!", width/2, 565);
            char1();
            text("player1", 95, 485);
            tint(255,128);
            char0();
            char2();
            noTint();
            }
        else if (player1 == 3 && player2 == 0) {
            text("Choose 2 players to start!", width/2, 565);
            char0();
            text("player1", 200, 485);
            tint(255,128);
            char1();
            char2();
            noTint();
            }
        else if (player1 == 0 && player2 == 1) {
            text("Choose 2 players to start!", width/2, 565);
            char2();
            text("player2", 305, 482);
            tint(255,128);
            char0();
            char1();
            noTint();
            }
        else if (player1 == 0 && player2 == 2) {
            text("Choose 2 players to start!", width/2, 565);
            char1();
            text("player2", 95, 485);
            tint(255,128);
            char0();
            char2();
            noTint();
            }
        else if (player1 == 0 && player2 == 3) {
            text("Choose 2 players to start!", width/2, 565);
            char0();
            text("player2", 200, 485);
            tint(255,128);
            char1();
            char2();
            noTint();
            }
        else if (player1 == 1 && player2 == 2) {
            char1();
            text("player1", 305, 482);
            char2();
            text("player2", 95, 485);
            tint(255,128);
            char0();
            noTint();
            }
        else if (player1 == 2 && player2 == 1) {
            char1();
            text("player2", 305, 482);
            char2();
            tint(255,128);
            text("player1", 95, 485);
            char0();
            noTint();
            }
        else if (player1 == 1 && player2 == 3) {
            char0();
            text("player2", 200, 485);
            char2();
            text("player1", 305, 482);
            tint(255,128);
            char1();
            noTint();
            }
        else if (player1 == 3 && player2 == 1) {
            char0();
            text("player1", 200, 485);
            char2();
            text("player2", 305, 482);
            tint(255,128);
            char1();
            noTint();
            }
        else if (player1 == 2 && player2 == 3) {
            char0();
            text("player1", 95, 485);
            char1();
            text("player2", 200, 485);
            tint(255,128);
            char2();
            noTint();
            }
        else if (player1 == 3 && player2 == 2) {
            char0();
            text("player2", 95, 485);
            char1();
            text("player1", 200, 485);
            tint(255,128);
            char2();
            noTint();
            }
        }
    }
    
    void mouseClicked() {
        if (playerNumber == 0){
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
        else if (playerNumber == 1){
            if ((mouseX >=  W * 1 / 6 - imageWidth / 3) && (mouseX<= (W * 1 / 6 - imageWidth / 2 + imageWidth)) && (mouseY>= H * 4 / 6) && (mouseY<= H * 4 / 6 + imageHeight)) {
                if (player1 == 2){
                    player1 = 0;
                }else if (player1 == 0 && player2 != 2){
                    player1 = 2;
                }
                else if (player2 == 2){
                    player2 = 0;
                }else{
                    player2 = 2;
                }
            }
            else if ((mouseX >=  W * 5 / 6 - imageWidth / 1.5) &&  (mouseX<= (W * 5 / 6 - imageWidth / 2 + imageWidth)) && (mouseY>= H * 4 / 6) && (mouseY<= H * 4 / 6 + imageHeight)) {
                if (player1 == 1){
                    player1 = 0;
                }else if (player1 == 0 && player2 != 1){
                    player1 = 1;
                }
                else if (player2 == 1){
                    player2 = 0;
                }else{
                    player2 = 1;
                }
            }
            else if ((mouseX >=  W * 3 / 6 - imageWidth / 2) && (mouseX<= (W * 3 / 6 - imageWidth / 2 + imageWidth)) && (mouseY>= H * 4 / 6) && (mouseY<= H * 4 / 6 + imageHeight)) {
                if (player1 == 3){
                    player1 = 0;
                }else if (player1 == 0 && player2 != 3){
                    player1 = 3;
                }
                else if (player2 == 3){
                    player2 = 0;
                }else{
                    player2 = 3;
                }
            }
            if ((mouseX >=  W * 0.36) && (mouseX<= W * 0.36 + 120) && (mouseY>= H * 0.85) && (mouseY<= H * 0.85 + 45)) {
                if (player1 > 0 && player2 > 0){
                    gameStart = true;
                }
            }
            if ((mouseX >= 315) && (mouseX<= 315 + 100) && (mouseY>= - 10) && (mouseY<= -10 + 100)) {
                settingState = true;
            }
            if ((mouseX >= 35 - 20) && (mouseX<= 35 + 20) && (mouseY>= 33 - 20) && (mouseY<= 33 + 20)) {
                helpState = true;
            }
        }
    }
}

class Settings {
  
  private String[] levels = {"Easy", "Medium", "Hard"}; // list of three options
  private int level = 0; // index of the currently selected option
  private String[] playerNumbers = {"1 Player", "2 Players"};
  private int playerNumber = 0;
  private float difficultyHeightDevider = 2.71;
  private float playerHeightDevider = 2.18;
  private float saveHeightDevider = 1.69;
  private int tmpLevel = 0;
  private int tmpPlayerNumber = 0;
  PImage crossImg = loadImage("crossbutton.png");


  private void difficulty() { 
    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    rect(width/2-57.5, height/difficultyHeightDevider, 115, 45, 10);  
        
    fill(80, 50, 0);
    textSize(24);
    text(levels[tmpLevel], width/2, height/difficultyHeightDevider +16);

    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    triangle(width/2-70, height/difficultyHeightDevider + 5, width/2-70, height/difficultyHeightDevider + 40, width/2-90, height/difficultyHeightDevider + 22.5);

    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    triangle(width/2+70, height/difficultyHeightDevider + 5, width/2+70, height/difficultyHeightDevider + 40, width/2+90, height/difficultyHeightDevider + 22.5);
    }

  private void players(){
    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    rect(width/2-57.5, height/playerHeightDevider, 115, 45, 10); 

    fill(80, 50, 0);
    textSize(24);
    text(playerNumbers[tmpPlayerNumber], width/2, height/playerHeightDevider +16);

    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    triangle(width/2-70, height/playerHeightDevider + 5, width/2-70, height/playerHeightDevider + 40, width/2-90, height/playerHeightDevider + 22.5);

    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    triangle(width/2+70, height/playerHeightDevider + 5, width/2+70, height/playerHeightDevider + 40, width/2+90, height/playerHeightDevider + 22.5);

  }

  private void saveButton(){
    push();
    fill(250, 213, 207);
    stroke(0);
    strokeWeight(1.2);
    rect(width/2-40, height/saveHeightDevider-20, 80, 40,20);

    fill(80, 50, 0);
    textFont(font);
    textSize(20);
    text("SAVE", width/2, height/saveHeightDevider-3);
    textAlign(CENTER, CENTER);
    pop();




    // fill(229, 226, 194);
    // stroke(0);
    // strokeWeight(1.2);
    // circle(width/2, height/saveHeightDevider, 40); 
    // fill(80, 50, 0);
    // textSize(30);
    // text("\u2713", width/2, height/saveHeightDevider-5);
  }
  
  void draw() {
    //small window
    fill(200);
    stroke(0);
    strokeWeight(1.2);
    rect(width/2-95, height/3-20, 200, 190+20, 5);
    // line(width/2-95, height/3-10, width/2-95 + 200, height/3-10);
    image(crossImg,width/2-95+200-30, height/3-10,20,20);

    difficulty();
    players();
    saveButton();
  }
  
  void mouseClicked() {
    if (mouseX >= width/2-90 && mouseX <= width/2-70 && mouseY >= height/difficultyHeightDevider + 5 && mouseY <= height/difficultyHeightDevider + 40) {
      if (tmpLevel > 0){
        tmpLevel--;
      }
    }
    if (mouseX >= width/2 + 70 && mouseX <= width/2 + 90 && mouseY >= height/difficultyHeightDevider + 5 && mouseY <= height/difficultyHeightDevider + 40){
      if (tmpLevel < 2){
        tmpLevel++;
      }
    }

    if (mouseX >= width/2-90 && mouseX <= width/2-70 && mouseY >= height/playerHeightDevider + 5 && mouseY <= height/playerHeightDevider + 40) {
      if (tmpPlayerNumber == 1){
        tmpPlayerNumber--;
      }
    }
    if (mouseX >= width/2 + 70 && mouseX <= width/2 + 90 && mouseY >= height/playerHeightDevider + 5 && mouseY <= height/playerHeightDevider + 40){
      if (tmpPlayerNumber == 0){
        tmpPlayerNumber++;
      }
    }
    //submit
    if (mouseX >= width/2-40 && mouseX <= width/2 - 40+80 && mouseY >= height/saveHeightDevider-20 && mouseY <= height/saveHeightDevider-20+40){
      level = tmpLevel;
      playerNumber = tmpPlayerNumber;
      settingState = false;
    }
    if (mouseX >= width/2-95+200-30 && mouseX <= width/2-95+200-30+20 && mouseY >= height/3-10 && mouseY <= height/3-10+20){
      tmpLevel = level;
      tmpPlayerNumber = playerNumber;
      settingState = false;
    }
  }
  
  public int getDifficulty(){
    return level;
  }

  public int getPlayerNumber(){
    return playerNumber;
  }

  public int setDifficulty(int level){
    return this.level = level;
  }

  public int setPlayerNumber(int playerNumber){
    return this.playerNumber = playerNumber;
  }
  
}

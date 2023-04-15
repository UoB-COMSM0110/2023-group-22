class Settings {
  
  private String[] levels = {"Easy", "Medium", "Hard"}; // list of three options
  private int level = 0; // index of the currently selected option
  private String[] playerNumbers = {"1 Player", "2 Players"};
  private int playerNumber = 0;
  private float difficultyHeightDevider = 2.71;
  private float playerHeightDevider = 2.18;
  private float saveHeightDevider = 1.69;


  private void difficulty() { 
    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    rect(width/2-57.5, height/difficultyHeightDevider, 115, 45, 10);  
        
    fill(80, 50, 0);
    textSize(24);
    text(levels[level], width/2, height/difficultyHeightDevider +16);

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
    text(playerNumbers[playerNumber], width/2, height/playerHeightDevider +16);

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
    fill(229, 226, 194);
    stroke(0);
    strokeWeight(1.2);
    circle(width/2, height/saveHeightDevider, 40); 
    fill(80, 50, 0);
    textSize(30);
    text("\u2713", width/2, height/saveHeightDevider-5);
  }
  
  void draw() {
    //small window
    fill(200);
    stroke(0);
    strokeWeight(1.2);
    rect(width/2-95, height/3, 200, 190, 5);

    difficulty();
    players();
    saveButton();
  }
  
  void mouseClicked() {
    if (mouseX >= width/2-90 && mouseX <= width/2-70 && mouseY >= height/difficultyHeightDevider + 5 && mouseY <= height/difficultyHeightDevider + 40) {
      if (level > 0){
        level--;
      }
    }
    if (mouseX >= width/2 + 70 && mouseX <= width/2 + 90 && mouseY >= height/difficultyHeightDevider + 5 && mouseY <= height/difficultyHeightDevider + 40){
      if (level < 2){
        level++;
      }
    }

    if (mouseX >= width/2-90 && mouseX <= width/2-70 && mouseY >= height/playerHeightDevider + 5 && mouseY <= height/playerHeightDevider + 40) {
      if (playerNumber == 1){
        playerNumber--;
      }
    }
    if (mouseX >= width/2 + 70 && mouseX <= width/2 + 90 && mouseY >= height/playerHeightDevider + 5 && mouseY <= height/playerHeightDevider + 40){
      if (playerNumber == 0){
        playerNumber++;
      }
    }
    if (mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= height/saveHeightDevider - 40 && mouseY <= height/saveHeightDevider + 40){
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

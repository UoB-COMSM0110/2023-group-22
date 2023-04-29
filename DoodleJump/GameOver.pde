
public class GameOver{
  PImage npc10 = loadImage("doodle.png");
  PImage npc11 = loadImage("astronaut_doodle.png");
  PImage npc12 = loadImage("ninja_doodle.png");



void draw(){
  // for (int i = platforms.size()-2; i >= 0; i--){
  //   platforms.remove(i);
  // }
  textSize(30);
  textAlign(CENTER);
  fill(0);
  if (setting.getPlayerNumber()==1){
    String[] player = {"Player 1", "Player 2"};
    text("Winner: "+ player[winner], W/2, H * 0.3);
    if (winner==0){
      if (npc==0){
        image(npc10, 300,  H * 0.3-50, 100, 70);
      }
      if (npc==1){
        image(npc11, 300,  H * 0.3-50, 100, 70);
      }
      if (npc==2){
        image(npc12, 300,  H * 0.3-50, 100, 70);
      }
    }
    else if (winner==1){
      if (npc2==0){
        image(npc10, 300,  H * 0.3-50, 100, 70);
      }
      if (npc2==1){
        image(npc11, 300,  H * 0.3-50, 100, 70);
      }
      if (npc2==2){
        image(npc12, 300,  H * 0.3-50, 100, 70);
      }
    }
  }
  else{
    text("You Scored "+ score, W/2, H * 0.3);
  }
  textSize(22);
  text("Hit SPACE bar to play again", W/2, H * 0.36);
  
  fill(229, 226, 194);
  stroke(0);
  strokeWeight(1.2);
  rect(W*0.36, H*0.47, 115, 45, 10);
    
  fill(80, 50, 0);
  textFont(font);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("HOME", W*0.505, H*0.5);
}

}

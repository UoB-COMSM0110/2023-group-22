
public class GameOver{



void draw(){
  // for (int i = platforms.size()-2; i >= 0; i--){
  //   platforms.remove(i);
  // }
  textSize(30);
  textAlign(CENTER);
  fill(0);
  text("You Scored "+ score, W/2, H * 0.3);
  textSize(22);
  text("Hit space to play again", W/2, H * 0.36);
  
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
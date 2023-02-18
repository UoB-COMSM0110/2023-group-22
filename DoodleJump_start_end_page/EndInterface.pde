PFont font;

void setup() {
  size(400, 400);
  font = createFont("Arial", 24);
  textFont(font);
}

void draw() {
  background(255);
  
  if (isSuccess()) {
    // Success message
    fill(0, 255, 0);
    textSize(50);
    textAlign(CENTER);
    text("Success!", width/2, height/3);
  } else {
    // Failure message
    fill(255, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("Game Over", width/2, height/3);
  }
  
  // Score message
  fill(0);
  textSize(32);
  textAlign(CENTER);
  text("Score: " + getScore(), width/2, height/2);
}

int getScore() {
  // Get the player's score
  // Replace this with your own score calculation
  return 1000;
}

boolean isSuccess() {
  // Determine if the player has succeeded
  // Replace this with your own success condition
  return true;
}

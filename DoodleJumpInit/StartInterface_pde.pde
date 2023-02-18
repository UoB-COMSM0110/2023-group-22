PFont font;

void setup() {
  size(400, 400);
  font = createFont("Arial", 24);
  textFont(font);
}

void draw() {
  background(255);
  fill(0);
  textAlign(CENTER);
  textSize(50);
  text("Doodle Jump", width/2, height/3);
  
  // Draw menu items
  textSize(32);
  fill(0, 150, 255);
  rect(width/2-100, height/2, 200, 50, 10);
  fill(255);
  text("Start", width/2, height/2 + 30);
  
  fill(255, 215, 0);
  rect(width/2-100, height/2 + 80, 200, 50, 10);
  fill(0);
  text("Settings", width/2, height/2 + 110);
  
  fill(255, 0, 0);
  rect(width/2-100, height/2 + 160, 200, 50, 10);
  fill(255);
  text("Exit", width/2, height/2 + 190);
}

void mousePressed() {
  if (mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height/2 && mouseY < height/2+50) {
    // Start the game
    exit();
  } else if (mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height/2+80 && mouseY < height/2+130) {
    // Open the settings menu
    println("Settings menu");
  } else if (mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height/2+160 && mouseY < height/2+210) {
    // Exit the game
    exit();
  }
}

class Egg {
  float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg
  float range;

  // Constructor
  Egg(float xpos, float ypos, float r, float s) {
    x = xpos;
    y = ypos;
    tilt = 0;
    scalar = s / 100.0;
    range = r;
  }

  void wobble() {
    tilt = cos(angle) / range;
    angle += 0.1;
    //print (angle + "-");
  }

  void display() {
    noStroke();
    fill(255);
    
    pushMatrix();
    translate(x, y);
    rotate(tilt);
    scale(scalar);
    
    
    beginShape();
    vertex(0, -100);
    bezierVertex(25, -100, 40, -65, 40, -40);
    bezierVertex(40, -15, 25, 0, 0, 0);
    bezierVertex(-25, 0, -40, -15, -40, -40);
    bezierVertex(-40, -65, -25, -100, 0, -100);
    endShape();
    
    
    beginShape();
    fill(255, 0, 0);
    rect(-25, -70, 10, 5);
    rect(15, -70, 10, 5);
    
    endShape();
    
    beginShape();
    fill(0, 0, 0);
    circle(-20, -55, 10);
    circle(20, -55, 10);
    endShape();
    
    beginShape();
    fill(0, 255, 0);
    triangle(0, -45, 5, -35, -5, -35);
    endShape();
    
    beginShape();
    fill(255,100,100);
    arc(0, -20, 30, 10, 0, PI);
    endShape();
    
    beginShape();
    fill(205, 100, 211);
    rect(-40, -100, 80, 15);
    //rect(-22, -120, 45, 30);
    endShape();
    
    beginShape();
    fill(250, 239, 23);
    //rect(-40, -100, 80, 15);
    rect(-22, -120, 45, 20);
    endShape();
    
    //fill(255, 0, 0);
    //circle(0, -30, 50);
    popMatrix();
    

  }
}

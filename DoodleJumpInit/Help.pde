class Help{
    private void window(){
        fill(200);
        stroke(80, 50, 0);
        strokeWeight(1.2);
        rect(width/2-152, height/5, 304, 400, 5);
        line(width/2 - 151, height/4 + 3, width/2 + 151, height/4 + 3);
        
        
        
    }

    private void basic(){
        fill(220);
        rect(width/2 - 152 + 8, height/5 + 50, 140, 160, 5);
        fill(80, 50, 0);
        textSize(20);
        textAlign(LEFT, TOP);
        text("Basic", width/2 - 100, height/4 + 20);
        textSize(10);
        text("* Click start to play", width/2 - 135, height/4 + 55);
        text("* Press left and right to", width/2 - 135, height/4 + 75);
        text("  control your character", width/2 - 135, height/4 + 90);
        text("* Press 'Z' to make a ", width/2 - 135, height/4 + 110);
        text("  platform, you can get 1", width/2 - 135, height/4 + 125);
        text("  every 30 points", width/2 - 135, height/4 + 140);

    }

    private void platformColor(){
        fill(220);
        rect(width/2 + 4, height/5 + 50, 140, 160, 5);
        fill(80, 50, 0);
        textSize(20);
        textAlign(LEFT, TOP);
        text("Platform Color", width/2 + 8, height/4 + 20);
        textSize(10);
        text("* Soft green: normal", width/2 + 15, height/4 + 55);
        text("* Yellow: fragile", width/2 + 15, height/4 + 75);
        text("* Red: broken", width/2 + 15, height/4 + 95);
        text("* Purple: helping platform", width/2 + 15, height/4 + 115);
    }

    private void difficulty(){
        fill(220);
        rect(width/2 - 152 + 8, height/5 + 220, 140, 160, 5);
        fill(80, 50, 0);
        textSize(20);
        textAlign(LEFT, TOP);
        text("Difficulty", width/2 - 125, height/4 + 190);
        textSize(10);
        text("* Easy: Only platforms and", width/2 - 135, height/4 + 225);
        text("  equipments", width/2 - 135, height/4 + 238);
        text("* Medium: Broken platform", width/2 - 135, height/4 + 258);
        text("  and monster added, you", width/2 - 135, height/4 + 271);
        text("  have to avoid them", width/2 - 135, height/4 + 284);
        text("* Hard: The gravity migth", width/2 - 135, height/4 + 304);
        text("  reverse! Try to challenge", width/2 - 135, height/4 + 317);
        text("  it!", width/2 - 135, height/4 + 330);
    }

    private void twoPlayer(){
        fill(220);
        rect(width/2 + 4, height/5 + 220, 140, 160, 5);
        fill(80, 50, 0);
        textSize(20);
        textAlign(LEFT, TOP);
        text("2-Player mode", width/2 + 8, height/4 + 190);
        textSize(10);
        text("* Stay alive before your", width/2 + 15, height/4 + 225);
        text("  opponent is out!", width/2 + 15, height/4 + 238);
        text("* Second Player: Press 'A'", width/2 + 15, height/4 + 258);
        text("  and 'D' to control", width/2 + 15, height/4 + 271);
    }

    private void closeButton(){ 
        fill(80, 50, 0);
        textSize(30);
        textAlign(LEFT, TOP);
        text("\u2715", width/2 + 125, height/4 - 37);
    }

    void draw() {
        window();
        
        if (mouseX >= width/2 - 152 + 8 && mouseX <= width/2 - 152 + 8 + 140 && mouseY >= height/5 + 50 && mouseY <= height/5 + 50 + 160){
            platformColor();
            difficulty();
            twoPlayer();
            pushMatrix();
            translate(-20, 80);
            scale(1.5);
            translate(20, -80);
            basic();
            popMatrix();
        }
        else if (mouseX >= width/2 + 4 && mouseX <= width/2 + 4 + 140 && mouseY >= height/5 + 50 && mouseY <= height/5 + 50 + 160){
            basic();
            difficulty();
            twoPlayer();
            pushMatrix();
            translate(420, 80);
            scale(1.5);
            translate(-420, -80);
            platformColor();
            popMatrix();
        }
        else if (mouseX >= width/2 - 152 + 8 && mouseX <= width/2 - 152 + 8 + 140 && mouseY >= height/5 + 220 && mouseY <= height/5 + 220 + 160){
            basic();
            platformColor();
            twoPlayer();
            pushMatrix();
            translate(-20, 600);
            scale(1.5);
            translate(20, -600);
            difficulty();
            popMatrix();
        }
        else if (mouseX >= width/2 + 4 && mouseX <= width/2 + 4 + 140 && mouseY >= height/5 + 50 && mouseY >= height/5 + 220 && mouseY <= height/5 + 220 + 160){
            basic();
            platformColor();
            difficulty();
            pushMatrix();
            translate(420, 600);
            scale(1.5);
            translate(-420, -600);
            twoPlayer();
            popMatrix();
        }
        else {
            basic();
            platformColor();
            difficulty();
            twoPlayer();
        }
        closeButton();
    }

    void mouseClicked(){
        if (mouseX >= width/2 + 130 - 15 && mouseX <= width/2 + 130 + 15 && mouseY >= height/4 - 20 - 15 && mouseY <= height/4 - 20 + 15){
            helpState = false;
        }
    }
}

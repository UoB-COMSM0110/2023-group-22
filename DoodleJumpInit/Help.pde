class Help{
    private void window(){
        fill(200);
        stroke(80, 50, 0);
        strokeWeight(1.2);
        rect(width/2-152, height/5, 304, 180, 5);
    }

    private void closeButton(){ 
        fill(80, 50, 0);
        textSize(30);
        text("\u2715", width/2 + 130, height/4 - 20);
        textSize(25);
        text("\u23af\u23af\u23af\u23af\u23af\u23af\u23af\u23af\u23af\u23af\u23af\u23af", width/2, height/4 - 3);
        text("Instructions", width/2, height/4 + 20);
        textSize(15);
        textAlign(LEFT, TOP);
        text("1. Click START to begin the game.", width/6, height/4 + 50);
        text("2. Press Left and RIGHT to move.", width/6, height/4 + 80);
        text("3. Press Z to release the held platform.", width/6, height/4 + 110);

    }

    void draw() {
        window();
        closeButton();
    }

    void mouseClicked(){
        if (mouseX >= width/2 + 130 - 15 && mouseX <= width/2 + 130 + 15 && mouseY >= height/4 - 20 - 15 && mouseY <= height/4 - 20 + 15){
            helpState = false;
        }
    }
}

public class PauseWindow{
  
  private int W = 400;
  private int H = 600;
  private float pauseX;
  private float pauseY;
  private float recX;
  private float recY;
  public boolean pauseState = false;
  public int stateUpdate;
  
  //private void blackBackground(){
  //  image(backImg,W,H); 
  //}
  
  private void window(float x,float y){
    this.recX=x;
    this.recY=y;
    push();
    fill(154, 153, 153); 
    stroke(0);
    strokeWeight(1.2);
    rect(x-100,y,200,190, 2);
    pop();
    push();
    fill(154, 205, 189); 
    stroke(0);
    strokeWeight(1.2);
    rect(x-80,y+30,160,50, 2);
    fill(0);
    text("CONTINUE", x, y+55);
    textAlign(CENTER, CENTER);
    pop();
    push();
    fill(233, 233, 111); 
    rect(x-80,y+110,160,50, 2);
    fill(0);
    text("EXIT", x, y+135);
    textAlign(CENTER, CENTER);
    pop();
    
  }
  
  public void pauseButton(float pauseX,float pauseY){
    this.pauseX = pauseX;
    this.pauseY = pauseY;
    image(pauseButton,pauseX,pauseY,30,30);
    
  }

  public void draw(float x,float y){
    window(x,y);
  }
  
  void mouseClicked(){
    if ((mouseX>=width-60)&&(mouseX<=width-30)&&(mouseY>=height/2-280)&&(mouseY<=height/2-250)){
      this.pauseState = true;
      //this.pauseState = !this.pauseState;
    }
    if ((mouseX>=width-60)&&(mouseX<=width-30)&&(mouseY>=20)&&(mouseY<=50)){
      this.pauseState = true;
      //this.pauseState = !this.pauseState;
    }
    if (this.pauseState){
      if ((mouseX>=this.recX-80)&&(mouseX<=this.recX+80)&&(mouseY>=this.recY+30)&&(mouseY<=this.recY+80)){
        this.pauseState=false;
      }
      if ((mouseX>=this.recX-80)&&(mouseX<=this.recX+80)&&(mouseY>=this.recY+110)&&(mouseY<=this.recY+160)){
        gameState=0;
        this.pauseState=false;
        doodler = new Doodler(W,H);
        platformCount = 6;
        gap = H/platformCount;
        platforms = new ArrayList<>();
        for (int i=0;i<platformCount;i++){
          platforms.add(new Platform(random(W-60),H-(gap*i)));
         }
         score=0;
      }
    }
    
  }
}

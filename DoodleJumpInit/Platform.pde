public class Platform{
  private float x;
  private float y;
  private float width=60;
  private float height=15;
  private int brokenChance = 20;
  private boolean broken = false;
  private boolean disappear = false;
  
  public Platform(float x,float y){
    this.x = x;
    this.y = y;
    if(random(100) < brokenChance){
      broken = true;
    }else{
      broken = false;
    }
  }
  
  public void draw(){
    if (!broken){
      fill (229, 226, 194);
      stroke(0);
      rect(this.x,this.y,this.width,this.height);
    }else if (broken && !disappear){
      fill(0, 200, 0); 
      stroke(0);
      rect(this.x,this.y,this.width,this.height);
    }else if (broken && disappear){
      fill(63, 204, 218, 0);
      stroke(63, 204, 218, 0);
      rect(this.x,this.y,this.width,this.height);
    }
  }
}

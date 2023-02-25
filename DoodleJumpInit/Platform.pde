public class Platform{
  private float x;
  private float y;
  private float width=60;
  private float height=15;
  //0: broken, 1: jump once, , 2: always can jump
  private int status = 2;
  private boolean disappear = false;
  
  public Platform(float x,float y){
    this.x = x;
    this.y = y;
    float rand = random(100);
    if(rand >= 0 && rand < 15){
      status = 0;
    }
    else if(rand >= 15 && rand < 30){
      status = 1;
    }else{
      status = 2;
    }
  }
  
  public void draw(){
    if (status == 2){
      fill (229, 226, 194);
      stroke(0);
      rect(this.x,this.y,this.width,this.height);
    }else if (status == 0 && !disappear){
      fill(0, 200, 0); 
      stroke(0);
      rect(this.x,this.y,this.width,this.height);
    }else if (status == 1 && !disappear){
      fill(250, 200, 0); 
      stroke(0);
      rect(this.x,this.y,this.width,this.height);
    }else if ((status == 0  || status == 1) && disappear){
      fill(63, 204, 218, 0);
      stroke(63, 204, 218, 0);
      rect(this.x,this.y,this.width,this.height);
    }
  }
}

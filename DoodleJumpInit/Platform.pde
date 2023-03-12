//Spawn chance for equipment
int springChance = 8;
int rocketChance = 80;

public class Platform{
  private float x;
  private float y;
  private float width=60;
  private float height=15;
  private Equipment equipment;
  //0: broken, 1: jump once, , 2: always can jump
  private int status = 2;
  public boolean disappear = false;
  
  public Platform(float x,float y,int type){
    this.x = x;
    this.y = y;
    if (type==0){
      status = 2;
    }
    else if (type==1){
      status = 2;
      equipment = new Equipment(random(this.x, (this.x + width)), (this.y - 5), 'S');
    }
    else if (type==2){
      status = 2;
      equipment = new Equipment(random(this.x, (this.x + width)), (this.y - 5), 'R');
    }
    
  }
  
  
  public Platform(float x,float y){
    this.x = x;
    this.y = y;
    float rand = random(100);
    if(prevBrokenPlatform==0 && rand >= 0 && rand < 10){
      status = 0;
      prevBrokenPlatform=1;
    }
    else if(rand >= 10 && rand < 25){
      status = 1;
      prevBrokenPlatform=0;
    }else{
      status = 2;
      prevBrokenPlatform=0;
      if (rand >=30 && rand<40){
        equipment = new Equipment(random(this.x, (this.x + width)), (this.y - 5), 'S');
      }
      else if (rand >=40 && rand<45){
        equipment = new Equipment(random(this.x, (this.x + width)), (this.y - 5), 'R');
      }
    }
  }
    
  public void draw(){
    if (status == 2){
      fill (229, 226, 194);
      stroke(0);
      strokeWeight(1.2);
      rect(this.x,this.y,this.width,this.height, 2);
    }else if (status == 0 && !disappear){
      fill(0, 200, 0); 
      stroke(0);
      strokeWeight(1.2);
      rect(this.x,this.y,this.width,this.height, 2);
    }else if (status == 1 && !disappear){
      fill(250, 200, 0); 
      stroke(0);
      strokeWeight(1.2);
      rect(this.x,this.y,this.width,this.height, 2);
    }
    else if ((status == 0  || status == 1) && disappear){
      fill(63, 204, 218, 0);
      stroke(63, 204, 218, 0);
      rect(this.x,this.y,this.width,this.height);
    }
  }
}

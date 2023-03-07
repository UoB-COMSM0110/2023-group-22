//Spawn chance for equipment
int springChance = 8;
int rocketChance = 80;

public class Platform{
  private float x;
  private float y;
  private float width=60;
  private float height=15;
  private Equipment equipment;
  
  public Platform(float x,float y){
    this.x = x;
    this.y = y;
    if(random(100) < springChance){
      equipment = new Equipment(random(this.x, (this.x + width)), (this.y - 5), 'S');
    }
    else if(random(100) > (100 - rocketChance)){
      equipment = new Equipment(random(this.x, (this.x + width)), (this.y - 5), 'R');
    }
  }
    
  public void draw(){
  fill (229, 226, 194);
  rect(this.x,this.y,this.width,this.height, 25);
  }
   
}

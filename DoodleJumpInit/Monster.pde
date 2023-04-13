public class Monster{
  
  private float x;
  private float y;
  private float width=40;
  private float height=40;
  private int type;
  private PImage monster_1 = loadImage("monster_1.png");
  private PImage monster_2 = loadImage("monster_2.png");
  private PImage monster_3 = loadImage("monster_3.png");
  
  public Monster(float x, float y){
    this.type = int(random(2));  
    this.x = x;
    this.y = y;
  }
  
  public void draw(){
    if(type == 0){
      image(monster_1, this.x, this.y, 80, 80);
    }
    if(type == 1){
      image(monster_2, this.x, this.y, 80, 80);
    }
    else{
      image(monster_3, this.x, this.y, 80, 80);
    }
  }
}

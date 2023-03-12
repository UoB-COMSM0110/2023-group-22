public class Equipment{
  private float x;
  private float y;
  private float width=15;
  private float height=15;
  private char type;
  
  public Equipment(float x, float y, char type){
    this.x = x;
    this.y = y;
    this.type = type;
  }
  
  public void draw(){
    if(type == 'S'){
      image(spring_img, (this.x - width/2), (this.y - height), 20, 20);
    }
    else{
      image(jetpack_img, (this.x - width/2), (this.y - height), 20, 20);
    }
  }
}

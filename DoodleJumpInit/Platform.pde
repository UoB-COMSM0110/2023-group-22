public class Platform{
  private float x;
  private float y;
  private float width=60;
  private float height=15;
  
  public Platform(float x,float y){
    this.x = x;
    this.y = y;
  }
  
  public void draw(){
  fill (229, 226, 194);
  rect(this.x,this.y,this.width,this.height);
}
   
}

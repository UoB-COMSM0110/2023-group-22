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
      fill (230, 230, 250);
      rect(this.x, this.y, this.width, this.height);
    }
    else{
      fill (210, 190, 100);
      rect(this.x, this.y, this.width, this.height);
    }
  }
}

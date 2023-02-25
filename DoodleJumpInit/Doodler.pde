public class Doodler{
  private float x;
  private float y;
  private float width=60;
  private float height=60;
  private int canvasW;
  private int canvasH;
  private float velocity = 0;
  private float gravity = 0.1;
  private float jumpForce = 10;
  
  public Doodler(int w,int h){
    this.canvasW = w;
    this.canvasH = H;
    this.x = w/2;
    this.y = h/2;
  }
  public void draw(){
    fill(100, 200, 250);
    rect(this.x,this.y,this.width,this.height);
  }

  public void update(ArrayList <Platform> platforms){
    if ((this.x + this.width)<0){
      this.x = this.canvasW;
    }
    if (this.x > this.canvasW){
      this.x = -this.width;
    }
    if (this.velocity < -9) this.velocity = -9;
    this.velocity += this.gravity;
    this.y += this.velocity;
    
    
    for (Platform platform:platforms) {
      if (this.y + this.height >= platform.y && this.y + this.height <= platform.y + platform.height){
   
        float minX = platform.x - this.width;
        float maxX = platform.x + platform.width;
        
        if (this.x >= minX && this.x <= maxX) {
          if(platform.broken == false){
            this.jump();
          }else if (platform.broken == true){
            platform.disappear = true;
          } 
        }
      }
    }
  }
  
  public void jump(){
    this.velocity -= this.jumpForce;
  }
  
  public void moveLeft(){
    this.x -= 30;
    //this.x = lerp(this.x,this.x-90,1);
  }
  
  public void moveRight(){
    this.x += 30;
    //this.x = lerp(this.x,this.x+90,1);
  }
  
  
  
}
  
  
    

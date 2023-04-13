// Added global variables to easily alter how high the spring jumps, how long/fast the rocket goes
float jumpConstant = -7;
float springConstant = -15;
float maxSpeed = -18;

public class Doodler{
  private float x;
  private float y;
  private float width=60;
  private float height=60;
  private int canvasW;
  private int canvasH;
  private float velocity = 0;
  private float x_velocity = 0;
  public float gravity = 0.1;
  public float jumpForce = jumpConstant;
  public int img_direction = 1;
  public boolean doodler_dissapear = false;
  //PImage npc10;
  PImage npc10 = loadImage("doodle.png");
  PImage npc11 = loadImage("astronaut_doodle.png");
  PImage npc12 = loadImage("ninja_doodle.png");
  PImage npc20 = loadImage("doodle_alternate.png");
  PImage npc21 = loadImage("astronaut_doodle_alternate.png");
  PImage npc22 = loadImage("ninja_doodle_alternate.png");
  PImage jetpack_img = loadImage("jetpack.png");
  PImage jetpack_effect_img = loadImage("jetpack_effect.png");
  PImage jetpack_effect_alt_img = loadImage("jetpack_effect_alt.png");

  
  
  
  public Doodler(int w,int h){
    this.canvasW = w;
    this.canvasH = h;
    this.x = w/2;
    this.y = h/2;
  }
  
  public Doodler(int w,int h,float x,float y){
    this.canvasW = w;
    this.canvasH = h;
    this.x = x;
    this.y = y;
  }
  public void draw(int npc){
    if(gravity == -0.1){
      if(img_direction != 1){
        image(jetpack_img, (this.x + 20), (this.y + 20), 30, 30);
        image(jetpack_effect_img, (this.x + 30), (this.y + 45), 30, 20);
      }
      if(img_direction == 1){
        image(jetpack_img, (this.x - 10), (this.y + 20), 30, 30);
        image(jetpack_effect_alt_img, (this.x - 20), (this.y + 45), 30, 20);
      }
    }
    if(img_direction == 1){
      if (npc==0){
        image(npc10, (this.x - width/2), this.y, 100, 70);
      }
      if (npc==1){
        image(npc11, (this.x - width/2), this.y, 100, 70);
      }
      if (npc==2){
        image(npc12, (this.x - width/2), this.y, 100, 70);
      }
    }
    if(img_direction != 1){
      if (npc==0){
        image(npc20, (this.x - width/2), this.y, 100, 70);
      }
      if (npc==1){
        image(npc21, (this.x - width/2), this.y, 100, 70);
      }
      if (npc==2){
        image(npc22, (this.x - width/2), this.y, 100, 70);
      }
    }
  }

  public void update(ArrayList <Platform> platforms,boolean down){
    int state = 0;
    if ((this.x + this.width)<0){
      this.x = this.canvasW;
    }
    if (this.x > this.canvasW){
      this.x = -this.width;
    }

    if(this.x_velocity != 0){
      this.x += this.x_velocity;
    }

    for (Platform platform:platforms){
        platform.y -=2;
    }

    for (Platform platform:platforms) {
      if (this.y + this.height >= platform.y && this.y + this.height <= platform.y + platform.height) {
        
        float minX = platform.x - (this.width/2);
        float maxX = platform.x + platform.width;
        
        if (this.x >= minX && this.x <= maxX) {
            this.y = platform.y-this.height;
            this.gravity = 0;
            this.velocity = 0;
            state = 1;
        }
      }
    }
    if (state==0){
        this.gravity = 0.1;
        this.velocity += this.gravity;
        this.y += this.velocity;
    }

  }




  public void update(ArrayList <Platform> platforms){
    if ((this.x + this.width)<0){
      this.x = this.canvasW;
    }
    if (this.x > this.canvasW){
      this.x = -this.width;
    }
    //if (this.velocity < -9 && this.boost == 0) this.velocity = -9;
    this.velocity += this.gravity;
    this.y += this.velocity;
    
    if(this.x_velocity != 0){
      this.x += this.x_velocity;
    }
        
    for (Platform platform:platforms) {
      if (this.y + this.height >= platform.y && this.y + this.height <= platform.y + platform.height){
   
        float minX = platform.x - this.width;
        float maxX = platform.x + platform.width;
        
        if (this.x >= minX && this.x <= maxX && this.velocity > 0) {
          if(platform.equipment != null){
            // Boolean function to check for equipment and Doodle collision
            if(rectRect(this.x, this.y, this.width, this.height, platform.equipment.x, platform.equipment.y, platform.equipment.width, platform.equipment.height)){
              if(platform.equipment.type == 'S'){
                // Alter jump height for one jump
                jumpForce = springConstant;
              }
              else{
                // Accelerate Doodle up the screen
                gravity = -0.1;
              }
            }
           this.jump(jumpForce);
          // Reset jump height if it has been altered by spring
          jumpForce = jumpConstant;
          }
          else if(platform.status == 2 || platform.status == 3){
            this.jump(jumpForce);
          }
          else if (platform.status == 1){
            this.jump(jumpForce);
            if (gameState==1){
              platform.status = 0;
              platform.disappear = true;
            }
            else if (gameState==3){
              if (platform.jump_chances==0){
                platform.status = 0;
                platform.disappear = true;
              }
              platform.jump_chances-=1;
            }
          }
          else if(platform.status == 0){
            platform.disappear = true;
          }
        }
      }
      //Reset gravity is it has been altered by rocket
      if(this.velocity < maxSpeed){
        gravity = 0.1;
        velocity = -7;
      }
    }
  }

  public void updateMonster(ArrayList <Monster> monsters){
   for(Monster monster: monsters){
     if (rectRect(this.x, this.y, this.width, this.height, monster.x, monster.y, monster.width, monster.height)){
      doodler_dissapear=true;
     }
   }
  }
 
  // Altered function to need a jump variable, ensures constant jump height to prevent chaining velocity. Also makes it easier to shift between normal and spring height.
  public void jump(float jumpForce){
    this.velocity = jumpForce;
  }
  
  // public void moveLeft(){
  //   this.x -= 30;
  // }
  
  // public void moveRight(){
  //   this.x += 30;
  // }
  //Boolean to check collision
  public boolean rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {
    if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
      r1x <= r2x + r2w &&    // r1 left edge past r2 right
      r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
      r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
        return true;
    }
    return false;
  }  
}

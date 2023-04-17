public class Platform{

  PImage normalPlatform = loadImage("Platform_normal.png");
  PImage yellowPlatform = loadImage("platform2_fly_away.png");
  PImage redPlatform = loadImage("Platform_red.png");
  PImage purplePlatform = loadImage("Platform_purple.png");
  
  private float x;
  private float y;
  private float width=60;
  private float height=15;
  private Equipment equipment;
  //0: broken, 1: jump once, , 2: always can jump
  private int status = 2;
  public boolean disappear = false;
  public int jump_chances=1;

  //Spawn chance for equipment
  private int minSpringChance = 30;
  private int maxSpringChance = 40;

  private int minRocketChance = 40;
  private int maxRocketChance = 45;

  
  //for start page
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
    else if (type==3){
      status = 3;
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
      if (rand >=minSpringChance && rand<maxSpringChance){
        equipment = new Equipment(random(this.x, (this.x + width)), (this.y - 5), 'S');
      }
      else if (rand >=minRocketChance && rand<maxRocketChance){
        equipment = new Equipment(random(this.x, (this.x + width)), (this.y - 5), 'R');
      }
    }
  }

  public Platform(float x,float y,boolean down){
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
    }
  }
    
  public void draw(){
    if (status == 2){
      //fill (229, 226, 194);
      //stroke(0);
      //strokeWeight(1.2);
      //rect(this.x,this.y,this.width,this.height, 2);
      image(normalPlatform, this.x,this.y,this.width,this.height);
    }else if (status == 0 && !disappear){
      // fill(200, 0, 0); 
      // stroke(0);
      // strokeWeight(1.2);
      // rect(this.x,this.y,this.width,this.height, 2);
      image(redPlatform, this.x,this.y,this.width,this.height);
    }else if (status == 1 && !disappear){
      // fill(250, 200, 0); 
      // stroke(0);
      // strokeWeight(1.2);
      // rect(this.x,this.y,this.width,this.height, 2);
      image(yellowPlatform, this.x,this.y,this.width * 1.5,this.height * 2.5);
    }
    else if (status == 3){
      //  fill (195, 180, 212);
      //  stroke(0);
      //  strokeWeight(1.2);
      //  rect(this.x,this.y,this.width,this.height, 2);
      image(purplePlatform, this.x,this.y,this.width,this.height);
    }
  }
}

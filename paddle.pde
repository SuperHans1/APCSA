public class Paddle {
    private float centerX;
    private float centerY;
    private float w;
    private float h;
    
  public Paddle(float centerX, float centerY, float w, float h){
    this.centerX = centerX;
    this.centerY = centerY;
    this.w = w;
    this.h = h;
   
  }
  
  public void update(){
     rectMode(CENTER);
     fill(225);
     rect(centerX, centerY, w, h);
  }
}

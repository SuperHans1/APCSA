public class Ball {
  private float centerX;
  private float centerY;
  private float xSpeed;
  private float ySpeed;

  public Ball(float x, float y, float xSpeed, float ySpeed) {
    this.centerX=x;
    this.centerY=y;
    this.xSpeed=xSpeed;
    this.ySpeed=ySpeed;
  }

  public void update() {
    centerX+=xSpeed;
    centerY+=ySpeed;
    if ((centerX+25 > width)|| (centerX-25 < 0)) {
      xSpeed*=-1;
    }
    if ((centerY-25 < 0)) {
      ySpeed*=-1;
    }
    if((centerY + 25) > (p.centerY - (p.h)/2) && (centerX + 25)> (p.centerX - (p.w)/2) && ((centerX-25) < (p.centerX + (p.w)/2)) ){
      ySpeed*= -1;
    }
    if(centerY+25 > height){
      centerX = width/2;
      centerY = height/ 2;
      xSpeed = 0;
      ySpeed = 0;
    }

    fill(255, 255, 255);
    circle(centerX, centerY, 50);
  } //end update
}//end ball class

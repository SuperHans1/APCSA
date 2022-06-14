Ball b;
Paddle p;


void setup() {
  size(800, 800);
  background(0, 0, 0);
  
  float xSpeed = random(2, 5);
  float ySpeed = random(2, 5);
  b = new Ball(random(0, 400),random(0, 400), xSpeed, ySpeed);
  p= new Paddle((width/2),(height - 50), 150, 30);
}

void draw(){
  background(0);
  fill(225);
  textSize(50);
  text("PONG", 350, 200);
  b.update();
  p.update();
  p.centerX = mouseX;
}

void mousePressed(){
  if(b.xSpeed == 0 && b.ySpeed == 0){
  float xSpeed = random(2, 5);
  float ySpeed = random(2, 5);
  b.xSpeed = xSpeed;
  b.ySpeed = ySpeed;
  }
}

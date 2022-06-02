Table table;
ArrayList <Happy> smile = new ArrayList <Happy>(); 
// Table and ArrayList used in the code


public void setup()
{// set up for the code
  //size(1800, 1000);
  background(255, 255, 255);
  fullScreen();
  

  table=loadTable("https://raw.githubusercontent.com/SuperHans1/APCSA/main/happy%20-%20happy.csv", "header");
  println(table.getRowCount()+ " total rows in table");

  for (int i = 0; i < 50; i++) { //for-loop for table variables and create faces
    int rank = table.getRow(i).getInt("Overall rank");
    String countries = table.getRow(i).getString("Country or region");
    float scores = table.getRow(i).getFloat("Score");
    float life = table.getRow(i).getFloat("Healthy life expectancy");
    float free= table.getRow(i).getFloat("Freedom to make life choices");
    float x = random(50, 1500);
    float y = random(50, 900);
    //float x= map(life, 0.713, 1.141, 50, width-80);
    //float y= map(free, 0.231, 0.631, height-80, 50);

    Happy faces = new Happy(x, y, 25, rank, countries, scores, life, free);
    smile.add(faces);
  }//end of for-loop
  textAlign(CENTER, CENTER);
  textSize(18);
  drawSmiley();
}//end of setup

public void drawSmiley() {//draws and updates each smiley face
background(255);
  for (Happy h : smile) {
    h.update();
  }// end of for loop
}// end of draw
public void instructions(){
    rectMode(CENTER);
    noFill();
    rect(950, 550, 500, 200, 20);
    text("This program shows the top 50 happiest countries!", 950, 500);
    text("Click on the countries in order to see the data of each country", 950, 550);
    text("and why they are ranked!", 950, 600);
}

public class Happy { //class for Happy
  private int overallRank;
  private String country;
  private float score;
  private float lifeExpectancy;
  private float freedom;
  private float x1;
  private float y1;
  private float extent;
  private boolean selected;
  // Starting position of shape    
  private float x1speed;  // Speed of the shape
  private float y1speed;  // Speed of the shape

  
//constuctor that will be called later in the code
  public Happy(float x, float y, float r, int overallRank, String country, float score, float lifeExpectancy, float freedom) {
    x1=x;
    y1=y;
    x1speed = random(-2,4.5);
    y1speed = random(-2,4.5);
    extent=score*15;
    this.overallRank = overallRank;
    this.country = country;
    this.score = score;
    this.lifeExpectancy = lifeExpectancy;
    this.freedom = freedom;
    boolean selected = false;
  }// end of constructor


  public void update() {
    // code for smiles speeds
    x1+=x1speed;
    y1+=y1speed;
    if((x1+extent > width) || (x1-50 < 0)){
      x1speed*=-1;
    }
    if((y1+extent > height)|| (y1-(extent-10) < 0)){
      y1speed*=-1;
    }
    
    // code for indiviual smiles
    fill(255, 255, 75);
    ellipse(x1, y1, extent, extent);
    fill(0, 0, 0);
    ellipse(x1-15, y1-10, 7, 10);
    ellipse(x1+15, y1-10, 7, 10);
    float smile = map(score, 7.769, 6.028, 25, 1);
    arc(x1, y1+10, 25, smile, radians(0), radians(180));
    text(overallRank + ". " + country, x1, y1+score*10);
    
    if(selected){ // checks to see if the smile is being pressed on then print the three facts
      text("1. " + score +" score", x1, y1+(score*10)+50);
      text("2. " + lifeExpectancy +" life expectancy", x1, y1+(score*10)+75);
      text("3. " + freedom +" freedom to make choices", x1, y1+(score*10)+100);
      
    }
  }//end of update
}// end of Happy class

void mousePressed() {
  for (Happy h : smile) {  //for loop to text show when the mouse is pressed at a certain promixity to the smile.
    h.selected = false;
    if(dist(mouseX,mouseY, h.x1, h.y1)<50){
      h.selected=true;
      
    fill(255, 255, 255, 0);
    instructions();
      
      
      
    }
  }
}

  void draw(){ 
    drawSmiley();
    instructions();
   
    
  }//end of draw
  

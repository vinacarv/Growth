int bg = 50;
int stroke = 255;
//float bX = width/2;
//float bY = height/2;
float canvasBorder = 20;
float bX = 200;
float bY = height-canvasBorder;
float thick = 6;
boolean branchPresent = false;
//Branch B1 = new Branch(bX, bY, thick);
ArrayList<Branch> branches = new ArrayList<Branch>(); //Declaring the arraylist
float fps = 0;
boolean started = false;


void setup() {
  size(400, 400);
  background(bg);
  frameRate(460);
  // bX = width/2;
  //bY = height/2;

  //branches = new ArrayList<Branch>();
}


void draw() {

  smooth();
  noStroke();
  strokeWeight(thick);
  strokeJoin(ROUND);
  strokeCap(ROUND);

  //B1.run();
  if (branchPresent) {
    for (int i = branches.size ()-1; i >= 0; i--) {
      Branch b = branches.get(i);
      b.run();
      println(b.dead);
      println("arraylist branches size = " + branches.size());
      //if (b.dead == true) {
      //  branches.remove(i);
     // }
      //branches[branches.size()-1].run();
    }
  }

  
  if (started) {
    fps = float(frameCount) /( (millis()+1)/1000);

    rectMode(CORNERS);
    fill(bg);
    noStroke();
    rect(0, 20, 150, 80); // cleans previous "gen" texts
    fill(stroke);

    text("FPS: " + fps, 20, 40);
    text(frameCount, 20, 60);
  }
}

void mouseClicked() {
  started = true;
  branches.add(new Branch(bX, bY, thick)); 
  if (branches.size() > 0)  branchPresent = true; 
  else if (branches.size() == 0) branchPresent = false;
}






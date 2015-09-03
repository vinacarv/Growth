
class Branch {

  float bX = width/2;
  float bbX = bX;
  float bY = height-canvasBorder;
  float bYi = bY;
  float thick = 2;
  float turnRange = 15; 
  float turn = random(turnRange-4, turnRange);
  boolean branching = false;
  int bCounter = 0;
  boolean alterning = true;
  boolean alt = alterning;
  float minStalk = 15;
  float maxStalk = 80;
  float stalkMaxSeg = random(minStalk, maxStalk);
  int generation = 0;
  boolean dead = false;


  Branch (float bX_, float bY_, float thick_) {
    bX = bX_; 
    bbX = bX_;
    bY = bY_;
    bYi = bY;
    thick = thick_;
    dead = false;
  }

  void run() {
    grow();
    update();
    branch();
  }

  void grow() {

    float stemSeg = 0;
    dead = false;

    if (bY > 40 && (bX > 20 || bX < width - 20)) {   //condition for growth   
      stemSeg = (bYi - bY);
      if ((stemSeg > stalkMaxSeg)) {                 //trigger for branching and 
        bbX = bX;
        bYi = bY;
        branching = true;
        turn = random(sin(radians(turnRange-5)), turnRange);

        if (alterning) {                             //alternates side of branching
          if (alt) {
            turn = -turn;
          }
        }

        minStalk -= random(1);
        maxStalk -= random(2);
        stalkMaxSeg = random(minStalk, maxStalk);
        turnRange -= random(0.5, 1);
        alt = !alt;

        display(bX, bY);//display main branch (dot on base of branching point)
        //loop();
        //   } else if (bX > 20 || bX < width - 20) {   //STILL IN X BOUNDARIES?
        //    display(bX, bY);
        //loop();
        // }
      }

      display(bX, bY); //display the length of the main branch
    }    
    //else if ((bX < 20 || bX > width-20 || bY < 20)) { //X OUT OF BOUNDARIES = GENERATION END + RESET
    else {
      generation++;

      println("GEN " + generation+ " GROWTH COMPLETE", 20, 20);

      rectMode(CORNERS);
      fill(bg);
      noStroke();
      rect(0, 0, 150, 60);                               // cleans previous "gen" texts
      fill(stroke);                                      //color of text = same as branches


      text("GEN " + generation, 20, 20);
      //text( " GROWTH COMPLETE", 20, 40);
      reset();
      //noLoop();
    }
    println("turn range " + turnRange);
    println("stem seg  " + stemSeg);
    println("stalk max seg " + stalkMaxSeg); 
    println("stalk length calc " + stemSeg % stalkMaxSeg);
    println("turn value: " + turn);
  }


  void reset() {

    minStalk = 15;
    maxStalk = 40;
    stalkMaxSeg = random(minStalk, maxStalk);
    turnRange = 15;
    turn = 0;
    bX = width/2;
    bbX = bX; 
    bY = 380;
    bYi = bY;
    dead = true;
  }

  void update() {
    bY--;
    // println(bX + "         " + bY);
  }

  void display(float bX_, float bY_) {
    stroke (255, 40);
    //    strokeWeight(10);
    point(bX_, bY_);
    //noStroke();
    //ellipse (bX, bY, thick, thick);
  }

  void branch() {

    if (branching) {
      //        for (int i = 30; bY % i == 0; i++) {
      if (bCounter <= 25) {
        bbX += turn; 
        //display(bX, bY);
        display(bbX, bY);
        bCounter++;
        if (turn > 0) {
          turn -= turn*0.2;
          if (turn < 0.5) turn = 0;
        } else if (turn < 0) {
          turn -= turn*0.2;
          if (turn > -0.5) turn = 0;
          // println("bCounter = " + bCounter + " branching = " + branching + " turn: " + turn);
        }
      } else if (bCounter >= 25) {
        branching = false;
        bCounter = 0;
        bbX = bX;
        // println("bCounter elseif  = " + bCounter + " branching = " + branching);
      }
      //      point((width-bX)%width, bY);
    }
  }
}


// declare global variables
float tileSizeX;
float tileSizeY;
float tileSpaceX;
float tileSpaceY;
float padding;

void setup() {
  size(915, 650);
  background(255);
  frameRate(60);
  
  // initialize global variables
  tileSizeX = 10;
  tileSizeY = 10;
  tileSpaceX = tileSizeX * 1.5;
  tileSpaceY = tileSizeY * 1.5;
  padding = tileSpaceX;
 
}


void draw() {
    pushMatrix();
    translate(padding,padding);
    for(int ix = 0; ix < 60; ix++)
    {
      for(int iy = 0; iy < 24; iy++)
      {
        fill(255);
        if(iy<hour() || (iy == hour() && ix < minute()))
        {
          fill(0);
          //if(iy % 4 == 0){fill(100);}
        }
        if(iy == hour() && ix == minute())
        {
          if(second() % 2 == 0)
          {
            fill(205);
          }
          else
          {
            fill(255);
          }
        }
        //rectMode(CENTER);
        //rect(ix*tileSpaceX,iy*tileSpaceY,tileSizeX,tileSizeY);
        ellipse(ix*tileSpaceX,iy*tileSpaceY,tileSizeX,tileSizeY);
      }
    }
  popMatrix();
  
  // print date on screen
  dateText();
}



String date() {
  fill(200);
  rectMode(CORNER);
  rect(width/2- 75, height - 25, 140, 25);
  fill(0);
  textSize(10);
  return(
    year()
    + "_" + month() 
    + "_" + day()
    + "_" + hour()
    + "_" + minute()
    + "_" + second()
    );
}

void dateText(){
  text(
    date(), 
    width/2 - 60, // constant length of date string 
    height -10
    );
}

void mousePressed() {
  saveFrame(date());
}
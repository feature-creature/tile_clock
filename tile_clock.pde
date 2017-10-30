// declare global variables
float tileSizeX;
float tileSizeY;
float tileSpace;

void setup() {
  size(600, 600);
  background(255);
  frameRate(60);
  
  // initialize global variables
  tileSizeX = width/60;
  tileSizeY = width/60;
  tileSpace = tileSizeX * 1.5;

}


void draw() {
  pushMatrix();
    translate(tileSpace,tileSpace);
    for(float ix = 0; ix < width - tileSpace; ix = ix + tileSpace)
    {
      for(float iy = 0; iy < height - tileSpace; iy = iy + tileSpace)
      {
        fill(0);
        rectMode(CENTER);
        rect(ix,iy,tileSizeX,tileSizeY);
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
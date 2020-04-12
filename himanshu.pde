ArrayList bricklist;
Ball bll;
Paddle Paddle;


void setup(){
 size(1024,764);
 background(0);
 noCursor();
 bll = new Ball (175, 420, 1, 2, color(random(255), random(255), random(255)));
 rectMode(CENTER);
  Paddle = new Paddle (height, 120, 30);
 bricklist = new ArrayList();
 for (int x = 1; x<=9; x++) {
    for (int y = 1; y<=4; y++) {
      bricklist.add(new Bricks (x*100+15, y*40+20, 90, 30));
    } 
  } 
}

void draw() {
  background(0);
  //
  //lets the ball move
  bll.move();
  // check collisions with Bricks
  for (int i = bricklist.size()-1; i>=0; i--) {
    // get the brick #i
    Bricks oneSingleBrick = (Bricks) bricklist.get(i);
    // check it
    if (oneSingleBrick.collide( bll.xposition, bll.yposition, bll.radiusBall ) ) {
      // this needs more attention: when he hits from below, yspeed needs to
      // be changed; when from the sides, xspeed
      bll.yspeed = bll.yspeed * -1;
      bricklist.remove(i);
    } // if
  } // for  
  bll.bounce();//allows ball to bounce off the edges
  bll.display();//displays the ball
  // display Bricks
  for (int i = bricklist.size()-1; i>=0; i--) {
    Bricks oneSingleBrick = (Bricks) bricklist.get(i);
    oneSingleBrick.display();
  } 
  // now Paddle stuff
  Paddle.move();//paddle is allowed to move
  Paddle.display();//displays the paddle
} 

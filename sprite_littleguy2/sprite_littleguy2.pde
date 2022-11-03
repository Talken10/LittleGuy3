import processing.sound.*;
SoundFile beep;

int gameState = 0; //0 startscreen, 1 is gameplay, 2 is being dead


Sprite s;
//Sprite g1;
//Sprite g2;
//Sprite g3;
Sprite f1;
Ground[]g;
Boulder b ;
Fire f;
int nGround = 8;


void setup()
{
 
  size (800,600);
  beep = new SoundFile(this, "64940__syna-max__wilhelm-scream.wav");
  s = new LittleGuy();
  reset();
}

void draw()
{
  if (gameState == 0) startScreen();
  if (gameState == 1) gamePlay();
  if (gameState == 2) deadScreen();
  
 }
 
 
void startScreen()
{
  noStroke ();
 colorMode(HSB);
  fill(5,175,245);
  rect(0,0,width, height);
  fill(255);
  textAlign(CENTER);
  textSize(25);
  fill(225);
  text(" little guy ", width/2, height/2);
  
  textAlign(CENTER);
  textSize(15);
  fill(225);
  text(" spress 's' to start ", (width/2), (height/2) + 25);
}
 
 void deadScreen()
{
  noStroke ();
  fill(0,0,0);
  rect(0,0,width, height);
  fill(255);
  textAlign(CENTER);
  text(" uh oh you're dead, press any key to try again", width/2, height/2);
}

 void gamePlay()
 {
 background(255);
 translate(width/2, height/2);
for(int i =0; i < nGround; i = i + 1)
{
 g[i].update();
 g[i].check();
 g[i].display();
}
  
 
 b.update();
 b.check();
 b.display();
 
 f1.update();
 f1.check();
 f1.display();
 
 
 s.update();
 s.check();
 s.display();
}

void keyPressed()
{
  if (key == 's')
  {
  if (gameState == 0) gameState = 1;
  }
  if (gameState == 1) gameState = 1;
  if (gameState == 2)
    {
      reset();
      gameState = 1;
    }
 if(key == 'w')
  {
 s.jump();
  }

if (key == 'd')
{
 f1.shoot(); 
}
}//end keypressed

 void reset()
 {
  //s = new Sprite(); //needed before extention
  s.location.x = (-width/2)+100;
  s.location.y=(height/2)-100;
  s.velocity.x = 0;
  s.acceleration.x = 0;
  
String[] files = {"littleguy1.svg", "littleguy2.svg"};
  s.addAnimation(files, 5);
  
  String[] files1 = {"littleguy1a.svg", "littleguy2a.svg"};
  s.addAnimation(files1, 5);

  String[] files2 = {"jump1.svg","jump2.svg"};
  s.addAnimation(files2, 10);
  
  String[] files3 = {"jump2.svg"};
  s.addAnimation(files3, 10);
  
  s.currentAni = 0;
 
   
  nGround = ceil(width/1000.0)+1;
  println(nGround);
  g = new Ground[nGround];
  String[] files4 = {"ground1.svg","ground2.svg","ground3.svg"};

for (int i = 0; i < nGround; i = i + 1)
  {
   g[i] = new Ground();
   g[i].addAnimation(files4, 15);
   g[i].location.x = -(width/2.0) + (g[i].boxX * i);    
  }

  String[] files6 = {"boulder.svg","boulder2.svg","boulder3.svg","boulder2.svg"};
  b= new Boulder();
  b.addAnimation(files6,6);


  f1 = new Fire();
  String[] files5 = {"fire.svg"};
  f1.addAnimation(files5, 10);
  
  /*
  g[1] = new Ground();
  String[] files4 = {"ground1.svg","ground2.svg","ground3.svg"};
  g[1].addAnimation(files4, 20);
  g[1].location.x= -(-width/2);

  
  g2 = new Ground();
 // String[] files5 = {"ground.svg"};
  g2.addAnimation(files4, 10);
  g2.location.x = -(-width/2) + (g2.boxX);

 
  g3 = new Ground();
  //String[] files6 = {"ground.svg"};
  g3.addAnimation(files4, 10);
  g3.location.x = -(-width/2) + (g3.boxX*2); 
 */

  
 // shape(s.ani.frames[0],0,0);
 // shape(s.ani.frames[1],0,0);
 }

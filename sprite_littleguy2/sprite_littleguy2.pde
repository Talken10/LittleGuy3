Sprite s;
Sprite g1;
Sprite g2;
Sprite g3;
Sprite f1;

void setup()
{
  size (800,600);
  s = new LittleGuy();
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
  
   
  f1 = new Fire();
  String[] files5 = {"fire.svg"};
  f1.addAnimation(files5, 10);

  
  g1 = new Ground();
  String[] files4 = {"ground1.svg","ground2.svg","ground3.svg"};
  g1.addAnimation(files4, 20);
  g1.location.x= -(-width/2);

  
  g2 = new Ground();
 // String[] files5 = {"ground.svg"};
  g2.addAnimation(files4, 10);
  g2.location.x = -(-width/2) + (g2.boxX);

 
  g3 = new Ground();
  //String[] files6 = {"ground.svg"};
  g3.addAnimation(files4, 10);
  g3.location.x = -(-width/2) + (g3.boxX*2);

  
 // shape(s.ani.frames[0],0,0);
 // shape(s.ani.frames[1],0,0);
}

void draw()
{
 background(255);
 translate(width/2, height/2);

  
 
 
 g1.update();
 g1.check();
 g1.display();
 
 g2.update();
 g2.check();
 g2.display();
 
 g3.update();
 g3.check();
 g3.display();
 
 f1.update();
 f1.check();
 f1.display();
 
 s.update();
 s.check();
 s.display();
}

void keyPressed()
{
  if(key == 'w')
  {
 s.jump();
  }

if (key == 'd')
{
 f1.shoot(); 
 f1.show();
}

}

class Fire extends Sprite
{
  boolean shoot = false;
  boolean show = false;
 Fire()
 {
  super();
   
    this.velocity.x = 0;
    this.location.y = (s.location.y)-100; 
    this.location.x = (s.location.x);
    
 }
 void shoot()
 {
   this.velocity.x = 5;
   this.acceleration.x = .25;
   this.shoot = true;
 }
 
 void show()
 {
    this.boxX = 100;
    this.boxY = 100;
    this.show = true;
 }
 void check()
 {
   if (this.location.x > width)
   {
    this.location.x = s.location.x; 
    this.shoot = false;
   }
  if (this.shoot)
  {
    this.shoot = true;
  }
 else
 {
  this.location.x = s.location.x; 
 }
 if (this.show)
 {
  this.show = false; 
  this.boxX = 0;
  this.boxY = 0;
 }
 }
}

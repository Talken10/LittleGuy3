class LittleGuy extends Sprite
{
  boolean isJump = false;
  LittleGuy()
  {
   super(); 
  } //end LittleGuy
  
  void jump()
  {
    this.velocity.y = -8;
    this.acceleration.y = 0.5;
    this.isJump=true;
  }//end void jump
  
  
  void check()
  {
      
    //float actualY = screenY(this.location.x, this.location.y);
    if(location.y > (height/2)-200)
    {
     this.acceleration.y = 0;
     this.velocity.y = 0;
     this.location.y =(height/2)-200;
     this.isJump = false;
    }
    
    if(this.isJump)
    {
      if(this.velocity.y < 0)
      {
        this.currentAni=2; //up
      }
     else
     {
       this.currentAni=3; //down
     }
   
    }
    else
    {
      this.currentAni=0; //grounded
    }
 
  }

  
}//Little Guy class

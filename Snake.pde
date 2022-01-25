class Snake
{
  
  float x;
  float y;
  float xspeed = scl;
  float yspeed = 0;
  
  
  int total = 0;
  PVector[] tail =  new PVector[20];
  
  void update()
  {
    
     for (int i=0;i < total-1; i++)
     {
      tail[i] = tail[i+1];
     }
     
     if (total > 0)
     {
       tail[total-1] = new PVector(x,y);
     }
     x += xspeed;
     y += yspeed;
     x = constrain(x,0 ,width-scl);
     y = constrain(y,0 , height - scl);
  }
  
  
  void dir(float xchange,float ychange)
  {
    xspeed = scl * xchange;
    yspeed = scl * ychange;
    
    
  }
  
  
  void death()
  {
     for (int i =0;i < total;i++)
     {
       PVector pos = tail[i];
       float d = dist(x,y,pos.x,pos.y);
       
       if (d<1)
       {
         total = 0;
         //PVector[] tail = {new PVector(x,y)};
       }
     }
  }
  
  boolean eat(PVector food)
  {
    float d = dist(x,y,food.x,food.y);
    
    if (d < 1)
    {
     total += 1;
     tail[total-1] = new PVector(x,y);
     return true; 
     
    }
    return false;
  }
  void show()
  {
    fill(255);
    
    for (int i=0;i < total;i++)
    {
      rect(tail[i].x,tail[i].y,scl,scl);
    }
    println(tail);
    rect(x,y,scl,scl);
     
  }
}

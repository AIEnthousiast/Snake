Snake snake;
float scl = 20;

PVector food;


void setup()
{
  
  snake = new Snake();
  frameRate(10);
  size(600,600);
  
  food = new PVector(random(width),random(height));
  pickLocation();
}


void pickLocation()
{
   int cols = floor(width/scl);
   int rows = floor(height/scl);
   
   food = new PVector(floor(random(cols)),floor(random(rows)));
   food.mult(scl);
}

void keyPressed()
{
   if (keyCode == UP)
   {
      snake.dir(0,-1);
      
   }
   else if (keyCode == DOWN)
   {
      snake.dir(0,1); 
   }
   else if (keyCode == LEFT)
   {
      snake.dir(-1,0); 
   }
   else if (keyCode == RIGHT)
   {
      snake.dir(1,0); 
   }
}


void draw()
{
  background(51);
  
  if (snake.eat(food))
  {
    pickLocation();
  }
  
  
  snake.update();
  snake.death();
  snake.show();
  
  
  
  
  
  fill(255,0,100);
  
  rect(food.x,food.y,scl,scl);
  
}

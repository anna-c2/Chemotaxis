PImage mom;
PImage chick;
int henX;
int henY;
Hen bob;
Chick[] sue;
Car[] will;
void setup()
{
  frameRate(15);
  size(600,600); 
  bob = new Hen();
  sue = new Chick[10];
  for(int i = 0; i < sue.length; i++)
  {
     sue[i] = new Chick();
   }
  will = new Car[10];
  for(int i = 0; i < will.length; i++)
  {
     will[i] = new Car((i + 1)*100);
   }
  mom = loadImage("chicken.png");
  chick = loadImage("chick.png");
}
void draw()
{
  background(#93D67F);
  fill(#AFADAA);
  rect(0,250,610,150);
  bob.walk();
  bob.show();
  for(int i = 0; i < sue.length; i++)
   {
     sue[i].show();
     sue[i].walk();
   }
    for(int i = 0; i < will.length; i++)
   {
     will[i].show();
     will[i].walk();
   }
   
  for(int i = 0; i < will.length; i++)
  {
    int distanceHen = (int)dist(henX, henY, will[i].myX, will[i].myY);
    int distanceChick = (int)dist(will[i].myX, will[i].myY, sue[i].myX, sue[i].myY);
    if(  distanceHen < 30 || distanceChick < 30)
    {
      dead();
      noLoop();
    }
  }
  
  if(sue[9].myY < 250)
  {
    success();
    noLoop();
  }
}
class Hen
{
  Hen()
  {
    henX = 300;
    henY = 570;
  }
  void walk()
  {   
     if (mouseX - henX >= 10) 
      henX = henX + (int)(Math.random()*5)+20;
    if (mouseX - henX <= -10) 
      henX = henX + (int)(Math.random()*5)-25;

    if (mouseY - henY >= 10) 
      henY = henY + (int)(Math.random()*5)+20;

    if (mouseY - henY <= -10) 
      henY = henY + (int)(Math.random()*5)-25;
   }
    void show()
   {
      image(mom, henX,henY, 70,70);
   }
}

class Chick
{
  int myX, myY;
  Chick()
  {
    for(int i = 0; i < sue.length; i++)
    {
      myX =  (i*10)+50;
      myY =  (i*10)+50;
    }
  }
  void walk()
  {
    for(int i = 0; i < sue.length; i++)
    {
      sue[i].myX =  henX+(int)(Math.random()*50+100);
      sue[i].myY =  henY+(int)(Math.random()*50+100);
    }
    
  }
  void show()
  {
    image(chick, myX, myY, 50, 50);
  }
}

class Car
{
  int myX, myY;
  color myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  Car(int n)
  {
    myX = n;
    myY = 270+(int)(Math.random()*100);
  }
  void walk()
  {
    myX = myX + (int)(Math.random()*5)-10;
  }
  void show()
  {
    fill(myColor);
    rect(myX, myY, 50, 30);
  }
  
  
}

void dead()
{
  noStroke();
  fill(#EA6161);
  rect(0,0,600,600);
  
  fill(#2C0707);
  textSize(58);
  text("Oh no!", 200, 200);
  textSize(40);
  text("The chickens got hit :(", 100, 300);
}
void success()
{
  noStroke();
  fill(#FAD890);
  rect(0,0,600,600);
  
  fill(0);
  textSize(30);
  text("The chickens thank you for",100,300);
  text("helping them cross the road :)", 100, 400);
}

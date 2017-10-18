// INITIALISATION

//menu
boolean  menu = true;
char     frame = 0;
PImage   image;

//assets
RGBColors  col = new RGBColors();
import  ddf.minim.*;
Minim  minim;
AudioPlayer  song;

//game
boolean  create = true;
boolean  tuto = false;
boolean  coolor = true;
boolean  ending = false;
Player  p = new Player();
char    ci = 0;
char    cj = 0;
char    phase = 0;

void  setup()
{
  minim = new Minim(this);
  song = minim.loadFile("Glade.mp3");
  song.loop();
  size(1280, 720);
  background(#333333);
  frameRate(100);
  image = loadImage("myself.jpg");
  p.setX(0);
  p.setY(179);
  p.setGravX(18);
  p.setGravY(18);
  p.setGravP(0);
  map = maps[0];
}

void  printMap()
{
  for (int i = 0; i < 64; i++)
  {
    for (int j = 0; j < 36; j++)
    {
      if (map[j][i] == 1 || map[j][i] == 7)
        fill(col.getR() - 100, col.getG() - 100, col.getB() - 100);
      else if (map[j][i] == 3 || map[j][i] == 8)
        fill(255 - col.getR(), 255 - col.getG(), 255 - col.getB());
      else if (map[j][i] > 1)
        fill(col.getR(), col.getG(), col.getB());
      if (map[j][i] != 0)
        rect(i * 20, j * 20, 20, 20);
    }
  }
}

void  menu()
{
  background(#333333);
  if (frame < 500)
  {
    textSize(40);
    fill(255, 255, 255, (frame < 255) ? (frame) : (255));
    text("\"Do not go where the path may lead..", 20 + frame / 5, 140);
    text("..go instead where there is no path.\" - R.W. Emerson", 200 - frame / 5, height - 100);
  }
  else
  {
    textSize(60);
    fill(255, 255, 255, (frame - 500 < 255) ? (frame - 500) : (255));
    text("\" Ephemeral Path \"", 365, 120);
    tint(255, (frame - 500 < 255) ? (frame - 500) : (255));
    image(image, width / 2 - 292 / 2, height - 479);
    textSize(30);
    text("by HealøgiK", 550, 200);
  }
  frame++;
  if (frame == 1000)
  {
    menu = false;
    background(#333333);
  }
}

void  ending()
{
  if (create)
    create();
  else
  {
    background(#333333);
    printMap();
    textSize(60);
    fill(255, 255, 255, (frame - 500 < 255) ? (frame - 500) : (255));
    text("\" Ephemeral Path \"", 365, 120);
    tint(255, (frame - 500 < 255) ? (frame - 500) : (255));
    image(image, width / 2 - 292 / 2, height - 479);
    textSize(30);
    text("by HealøgiK", 550, 200);
    p.move(keyRight, keyLeft, keyUp, keyDown);
    p.display(map);
  }
frame++;
}

void  create()
{
  cj = 0;
  while (cj != 36)
  {
    if (map[cj][ci] == 1 || map[cj][ci] == 7)
      fill(col.getR() - 100, col.getG() - 100, col.getB() - 100);
    else if (map[cj][ci] == 3 || map[cj][ci] == 8)
      fill(255 - col.getR(), 255 - col.getG(), 255 - col.getB());
    else if (map[cj][ci] > 1)
      fill(col.getR(), col.getG(), col.getB());
    if (map[cj][ci] != 0)
      rect(ci * 20, cj * 20, 20, 20);
    cj++;
  }
  ci++;
  if (ci == 64)
  {
    ci = 0;
    create = false;
  }
}

void  tuto()
{
  background(#333333);
  if (frame < 300)
  {
    textSize(90);
    fill(255, 255, 255, (frame < 255) ? (frame) : (255));
    text("GOOD", 460 + frame / 5, 340);
    text("JOB !", 560 - frame / 5, height - 300);
  }
  else
  {
    textSize(70);
    fill(255, 255, 255, (frame - 300 < 255) ? (frame - 300) : (255));
    text("Now let's add..", 365, 320);
    fill(255, 255, 255, (frame - 400 < 255) ? (frame - 400) : (255));
    text("Level's Shapeshifting cells !", 300 - frame / 5, height - 300);
  }
  frame++;
  if (frame == 750)
  {
    tuto = false;
    background(#333333);
  }
}

void  draw()
{
  if (menu)
    menu();
  else if (tuto)
    tuto();
  else if (ending)
    ending();
  else if (create)
    create();
  else
  {
    background(#333333);
    printMap();
    p.move(keyRight, keyLeft, keyUp, keyDown);
    p.display(map);
    if (map[p.getY() / 20][p.getX() / 20] == 3
       || (p.getX() / 20 + 1 < width / 20 && map[p.getY() / 20][p.getX() / 20 + 1] == 3)
       || (p.getY() / 20 + 1 < height / 20 && map[p.getY() / 20 + 1][p.getX() / 20] == 3)
       || (p.getY() / 20 + 1 < height / 20 && p.getX() / 20 + 1 < width / 20 && map[p.getY() / 20 + 1][p.getX() / 20 + 1] == 3)
       || (p.getY() / 20 + 2 < height / 20 && map[p.getY() / 20 + 2][p.getX() / 20] == 3)
       || (p.getY() / 20 + 2 < height / 20 && p.getX() / 20 + 1 < width / 20 && map[p.getY() / 20 + 2][p.getX() / 20 + 1] == 3))
    {
      map = maps[++phase];
      coolor = false;
    }
    if (p.getX() > width - 30)
    {
      if (phase == 7)
        tuto = true;
      if (phase == 19)
        ending = true;
      if (!ending)
        map = maps[++phase];
      else
      {
        map = maps[0];
        map[8][0] = 6;
        map[9][0] = 6;
        map[10][0] = 6;
        map[30][63] = 6;
        map[31][63] = 6;
        map[32][63] = 6;
      }
      p.setX(0);
      p.setY(179);
      create = true;
      frame = 0;
      background(#333333);
      keyUp = false;
      keyDown = false;
      keyLeft = false;
      keyRight = false;
      cj = 0;
      coolor = true;
      if (ending)
      {
         p.setX(21);
      }
      while (cj != 36)
      {
        col.inc();
        cj++;
      }
    }
  }
}
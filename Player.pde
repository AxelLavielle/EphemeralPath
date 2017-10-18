class  Player
{
  int  posX = 0;
  int  posY = 0;
  int  posXs = 0;
  int  posYs = 0;
  float  gravX = 0;
  float  gravY = 0;
  float  speGravX = 0;
  float  speGravY = 0;
  float  gravP = 0;
  float  speY = 0;
  float  speX = 0;
  float  speYs = 0;
  float  speXs = 0;

  Player() {}

//COLLISIONS

  //COLLISIONS SPEED
  void  display(char[][] map)
  {
    posXs = posX;
    posYs = posY;
    while ((speX > 0.7 || speY > 0.7 || speX < -0.7 || speY < -0.7)
            && ((posXs == posX && posYs == posY)
            || map[posY / 20][posX / 20] > 5
            || (posX / 20 + 1 < width / 20 && map[posY / 20][posX / 20 + 1] > 5)
            || (posY / 20 + 1 < height / 20 && map[posY / 20 + 1][posX / 20] > 5)
            || (posY / 20 + 1 < height / 20 && posX / 20 + 1 < width / 20 && map[posY / 20 + 1][posX / 20 + 1] > 5)
            || (posY / 20 + 2 < height / 20 && map[posY / 20 + 2][posX / 20] > 5)
            || (posY / 20 + 2 < height / 20 && posX / 20 + 1 < width / 20 && map[posY / 20 + 2][posX / 20 + 1] > 5)))
    {
      posX = posXs + (int)speX;
      posY = posYs + (int)speY;
      if (posX < 0)
      {
        speX = 0;
        posX = 0;
      }
      else if (posX > width - 20)
      {
        speX = 0;
        posX = width - 20;
      }
      if (posY < 0)
      {
        speY = 0;
        posY = 0;
      }
      else if (posY > height - 40)
      {
        speY = 0;
        posY = height - 40;
      }
      if (map[posY / 20][posX / 20] > 5
          || (posX / 20 + 1 < width / 20 && map[posY / 20][posX / 20 + 1] > 5)
          || (posY / 20 + 1 < height / 20 && map[posY / 20 + 1][posX / 20] > 5)
          || (posY / 20 + 1 < height / 20 && posX / 20 + 1 < width / 20 && map[posY / 20 + 1][posX / 20 + 1] > 5)
          || (posY / 20 + 2 < height / 20 && map[posY / 20 + 2][posX / 20] > 5)
          || (posY / 20 + 2 < height / 20 && posX / 20 + 1 < width / 20 && map[posY / 20 + 2][posX / 20 + 1] > 5))
      {
        if (speY > -0.3 && speY < 0.3 && (speX > 0.3 || speX < -0.3))
          resetSpeX();
        else if (speX > -0.3 && speX < 0.3 && (speY > 0.3 || speY < -0.3))
          resetSpeY();
        else if ((speX < -0.3 || speX > 0.3) && (map[posY / 20][(posX - (int)speX) / 20] < 6
          && ((posX - (int)speX) / 20 + 1 < width / 20 && map[posY / 20][(posX - (int)speX) / 20 + 1] < 6)
          && (posY / 20 + 1 < height / 20 && map[posY / 20 + 1][(posX - (int)speX) / 20] < 6)
          && (posY / 20 + 1 < height / 20 && (posX - (int)speX) / 20 + 1 < width / 20 && map[posY / 20 + 1][(posX - (int)speX) / 20 + 1] < 6)
          && (posY / 20 + 2 < height / 20 && map[posY / 20 + 2][(posX - (int)speX) / 20] < 6)
          && (posY / 20 + 2 < height / 20 && (posX - (int)speX) / 20 + 1 < width / 20 && map[posY / 20 + 2][(posX - (int)speX) / 20 + 1] < 6)))
          resetSpeX();
        else if ((speY < -0.3 || speY > 0.3) && map[(posY - (int)speY) / 20][posX / 20] < 6
          && (posX / 20 + 1 < width / 20 && map[(posY - (int)speY) / 20][posX / 20 + 1] < 6)
          && ((posY - (int)speY) / 20 + 1 < height / 20 && map[(posY - (int)speY) / 20 + 1][posX / 20] < 6)
          && ((posY - (int)speY) / 20 + 1 < height / 20 && posX / 20 + 1 < width / 20 && map[(posY - (int)speY) / 20 + 1][posX / 20 + 1] < 6)
          && ((posY - (int)speY) / 20 + 2 < height / 20 && map[(posY - (int)speY) / 20 + 2][posX / 20] < 6)
          && ((posY - (int)speY) / 20 + 2 < height / 20 && posX / 20 + 1 < width / 20 && map[(posY - (int)speY) / 20 + 2][posX / 20 + 1] < 6))
          resetSpeY();
        else
        {
          resetSpeX();
          resetSpeY();
        }
      }
    }
    if (speX > -0.7 && speX < 0.7)
      posX = posXs;
    if (speY > -0.7 && speY < 0.7)
      posY = posYs;

    //COLLISIONS GRAVITY
    
    posXs = posX;
    posYs = posY;
    calcGravX();
    calcGravY();
    while ((speGravX > 0.7 || speGravY > 0.7 || speGravX < -0.7 || speGravY < -0.7)
            && ((posXs == posX && posYs == posY)
            || map[posY / 20][posX / 20] > 5
            || (posX / 20 + 1 < width / 20 && map[posY / 20][posX / 20 + 1] > 5)
            || (posY / 20 + 1 < height / 20 && map[posY / 20 + 1][posX / 20] > 5)
            || (posY / 20 + 1 < height / 20 && posX / 20 + 1 < width / 20 && map[posY / 20 + 1][posX / 20 + 1] > 5)
            || (posY / 20 + 2 < height / 20 && map[posY / 20 + 2][posX / 20] > 5)
            || (posY / 20 + 2 < height / 20 && posX / 20 + 1 < width / 20 && map[posY / 20 + 2][posX / 20 + 1] > 5)))
    {
      posX = posXs + (int)speGravX;
      posY = posYs + (int)speGravY;
      if (posX < 0)
      {
        speGravX = 0;
        posX = 0;
      }
      else if (posX > width - 20)
      {
        speGravX = 0;
        posX = width - 20;
      }
      if (posY < 0)
      {
        speGravY = 0;
        posY = 0;
      }
      else if (posY > height - 40)
      {
        speGravY = 0;
        posY = height - 40;
      }
      if (map[posY / 20][posX / 20] > 5
          || (posX / 20 + 1 < width / 20 && map[posY / 20][posX / 20 + 1] > 5)
          || (posY / 20 + 1 < height / 20 && map[posY / 20 + 1][posX / 20] > 5)
          || (posY / 20 + 1 < height / 20 && posX / 20 + 1 < width / 20 && map[posY / 20 + 1][posX / 20 + 1] > 5)
          || (posY / 20 + 2 < height / 20 && map[posY / 20 + 2][posX / 20] > 5)
          || (posY / 20 + 2 < height / 20 && posX / 20 + 1 < width / 20 && map[posY / 20 + 2][posX / 20 + 1] > 5))
      {
        if (speGravY > -0.3 && speGravY < 0.3 && (speGravX > 0.3 || speGravX < -0.3))
          resetSpeGravX();
        else if (speGravX > -0.3 && speGravX < 0.3 && (speGravY > 0.3 || speGravY < -0.3))
          resetSpeGravY();
        else if ((speGravX < -0.3 || speGravX > 0.3) && (map[posY / 20][(posX - (int)speGravX) / 20] < 6
          && ((posX - (int)speGravX) / 20 + 1 < width / 20 && map[posY / 20][(posX - (int)speGravX) / 20 + 1] < 6)
          && (posY / 20 + 1 < height / 20 && map[posY / 20 + 1][(posX - (int)speGravX) / 20] < 6)
          && (posY / 20 + 1 < height / 20 && (posX - (int)speGravX) / 20 + 1 < width / 20 && map[posY / 20 + 1][(posX - (int)speGravX) / 20 + 1] < 6)
          && (posY / 20 + 2 < height / 20 && map[posY / 20 + 2][(posX - (int)speGravX) / 20] < 6)
          && (posY / 20 + 2 < height / 20 && (posX - (int)speGravX) / 20 + 1 < width / 20 && map[posY / 20 + 2][(posX - (int)speGravX) / 20 + 1] < 6)))
          resetSpeGravX();
        else if ((speGravY < -0.3 || speGravY > 0.3) && map[(posY - (int)speGravY) / 20][posX / 20] < 6
          && (posX / 20 + 1 < width / 20 && map[(posY - (int)speGravY) / 20][posX / 20 + 1] < 6)
          && ((posY - (int)speGravY) / 20 + 1 < height / 20 && map[(posY - (int)speGravY) / 20 + 1][posX / 20] < 6)
          && ((posY - (int)speGravY) / 20 + 1 < height / 20 && posX / 20 + 1 < width / 20 && map[(posY - (int)speGravY) / 20 + 1][posX / 20 + 1] < 6)
          && ((posY - (int)speGravY) / 20 + 2 < height / 20 && map[(posY - (int)speGravY) / 20 + 2][posX / 20] < 6)
          && ((posY - (int)speGravY) / 20 + 2 < height / 20 && posX / 20 + 1 < width / 20 && map[(posY - (int)speGravY) / 20 + 2][posX / 20 + 1] < 6))
          resetSpeGravY();
        else
        {
          resetSpeGravX();
          resetSpeGravY();
        }
      }
    }
    if (speGravX > -0.7 && speGravX < 0.7)
      posX = posXs;
    if (speGravY > -0.7 && speGravY < 0.7)
      posY = posYs;

    // affichage
    if (coolor)
      fill(#EEEEEE);
    else
      fill(255 - col.getR() + 160, 255 - col.getG() + 160, 255 - col.getB() + 160);
    rect(posX, posY, 20, 40);
  }

//GRAVITY
  
  void  setGravX(int x)
  {
    gravX = x * 20;
  }

  void  setGravY(int y)
  {
    gravY = y * 20;
  }

  void  setGravP(int p)
  {
    gravP = p;
  }

  void  calcGravX()
  {
    if (sqrt((gravX - posX) * (gravX - posX) + (gravY - posY) * (gravY - posY)) > 150)
      speGravX = 0;    
    else if (gravX < posX)
      speGravX = -0.5 * gravP;
    else if (gravX != posX)
      speGravX = 0.5 * gravP;
    else
      speGravX = 0;
  }

  void  calcGravY()
  {
    if (sqrt((gravX - posX) * (gravX - posX) + (gravY - posY) * (gravY - posY)) > 150)
      speGravY = 0;    
    else if (gravY < posY)
      speGravY = -0.5 * gravP;
    else if (gravY != posY)
      speGravY = 0.5 * gravP;
    else
      speGravY = 0;
  }

  void  resetSpeGravX()
  {
    if (speGravX > 0)
      speGravX -= 0.5;
    else if (speGravX < 0)
      speGravX += 0.5;
  }

  void  resetSpeGravY()
  {
    if (speGravY > 0)
      speGravY -= 0.5;
    else if (speGravY < 0)
      speGravY += 0.5;
  }

//MOVEMENT

  void  incX()
  {
    if (speX <= 5)
      speX += 1;
  }
  
  void  incY()
  {
    if (speY <= 5)
      speY += 1;
  }

  void  decX()
  {
    if (speX >= -5)
      speX -= 1;
  }
  
  void  decY()
  {
    if (speY >= -5)
      speY -= 1;
  }
  
  void  setX(int x)
  {
    posX = x;
  }
  
  void  setY(int y)
  {
    posY = y;
  }

  void  resetSpeX()
  {
    if (speX > 0)
      speX -= 0.5;
    else if (speX < 0)
      speX += 0.5;
  }

  void  resetSpeY()
  {
    if (speY > 0)
      speY -= 0.5;
    else if (speY < 0)
      speY += 0.5;
  }

  void  move(boolean keyRight, boolean keyLeft, boolean keyUp, boolean keyDown)
  {
    if (keyRight && !keyLeft)
      this.incX();
    else if (keyLeft && !keyRight)
      this.decX();
    else
      this.resetSpeX();
    if (keyDown && !keyUp)
      this.incY();
    else if (keyUp && !keyDown)
      this.decY();
    else
      this.resetSpeY();
  }

  int  getX()
  {
    return (posX);
  }

  int  getY()
  {
    return (posY);
  }
}
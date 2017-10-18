class    RGBColors
{
  int  R = 160;
  int  G = 160;
  int  B = 255;
  char phase = 0;

  RGBColors()  {}

  void  inc()
  {
    if (phase % 3 == 0)
    {
      B--;
      R++;
    }
    else if (phase % 3 == 1)
      {
      R--;
      G++;
    }
    else
    {
      G--;
      B++;
    }
    if (R == 255 || G == 255 || B == 255)
      phase++;
  }

  int  getR()
  {
    return R;
  }
  
  int  getG()
  {
    return G;
  }
  
  int  getB()
  {
    return B;
  }
  
}
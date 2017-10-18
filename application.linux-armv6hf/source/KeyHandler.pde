boolean  keyUp = false;
boolean  keyDown = false;
boolean  keyLeft = false;
boolean  keyRight = false;

// KEYHANDLER

void  keyPressed()
{
  if (key == CODED)
    if (keyCode == UP)
      {
        if (phase != 7)
          keyUp = true;
        else
          keyLeft = true;
      }
    else if (keyCode == DOWN)
      {
        if (phase != 7)
          keyDown = true;
        else
          keyRight = true;
      }
    else if (keyCode == LEFT)
      {
        if (phase != 7)
          keyLeft = true;
        else
          keyUp = true;
      }
    else if (keyCode == RIGHT)
      {
        if (phase != 7)
          keyRight = true;
        else
          keyDown = true;
      }
}

void  keyReleased()
{
  if (key == CODED)
    if (keyCode == UP)
      {
        if (phase != 7)
          keyUp = false;
        else
          keyLeft = false;
      }
    else if (keyCode == DOWN)
      {
        if (phase != 7)
          keyDown = false;
        else
          keyRight = false;
      }
    else if (keyCode == LEFT)
      {
        if (phase != 7)
          keyLeft = false;
        else
          keyUp = false;
      }
    else if (keyCode == RIGHT)
      {
        if (phase != 7)
          keyRight = false;
        else
          keyDown = false;
      }
}
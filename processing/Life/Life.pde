/*
 if the cell is alive
   if < 2 neighbours, the cell dies
   if 2 or 3 neighbours it survives
   if > 3 neighbours, it dies due to overcrowding
 if the cell is dead
   if it has exactly 3 neighbours it comes back to life
*/

boolean paused = false;


boolean getCell(int row, int col)
{
   if (row < 0 || row >= boardHeight || col < 0 || col >= boardWidth)
   {
     return false;
   }
   else
   {
     return board[row][col];
   }
}

// Counting neighbours with a loop
int countNeighboursWithLoop(int row, int col)
{
  int count = 0;
  for (int r = row - 1 ; r <= row + 1 ; r ++)
  {
    for (int c = col - 1 ; c <= col + 1 ; c ++)
    {
      if ((!(r == row && c == col)) && getCell(r,c))
      {
        count ++;
      }      
    }
  }
  return count;
}

// Counting neighbours with if statements
int countNeighbours(int row, int col)
{
  int count = 0;
  
  // Put your code in here...
  // Top left
  if ((row > 0) && (col > 0) && (board[row - 1][col -1]))
  {
    count ++;
  }
  // Top
  if ((row > 0) && board[row -1][col])
  {
    count ++;
  }
  // Top right
  if ((row > 0) && (col < (boardWidth - 1)) && (board[row -1][col + 1]))
  {
    count ++;
  }
  // Left
  if ((col > 0) && (board[row][col -1]))
  {
    count ++;
  }
  // Right
  if ((col < (boardWidth -1)) && board[row][col + 1])
  {
    count ++;
  }
  // Bottom left
  if ((col > 0) && (row < (boardHeight - 1)) 
    && board[row + 1][col - 1])
  {
    count ++;
  }
  // Bottom
  if ((row < (boardHeight -1)) && (board[row + 1][col]))
  {
    count ++;
  }
  // Bottom right
  if ((col < (boardWidth - 1)) && (row < (boardHeight - 1)) 
    && board[row + 1][col + 1])
  {
    count ++;
  }
  return count;
}

void startShape()
{
  for (int col = 0; col < boardWidth ; col ++)
  {
    board[20][col] = true;
    board[30][col] = true;
  }
}

void setup()
{
  size(1000, 1000, P2D);
  cellWidth = width / (float) boardWidth;
  cellHeight = height / (float) boardHeight;
  board = new boolean[boardHeight][boardWidth];
  next = new boolean[boardHeight][boardWidth];
  //randomise(); 
  startShape();
  
  filledColor = color(random(200, 255), random(200, 255), random(0, 50));
  backColor = color(random(0, 100), random(20, 50), random(0, 50));
  
      targetFilledColor = color(random(200, 255), random(200, 255), random(0, 50));
    targetBackColor = color(random(0, 100), random(20, 50), random(0, 50));

}

boolean[][] board;
boolean[][] next;
float cellWidth;
float cellHeight;
int boardWidth = 50;
int boardHeight = 50;
color c = color(0, 0, 0);

void randomise()
{
  for (int row = 0 ; row < boardHeight ; row ++)
  {
    for (int col = 0 ; col < boardWidth ; col ++)
    {
      float f = random(0, 1);
      if (f > 0.5f)
      {
        board[row][col] = true;
      }
    }
  }
}

void keyPressed()
{
  paused = ! paused;
}

void update()
{
  
  if (! paused)
  {
    for (int row = 0 ; row < boardHeight ; row ++)
    {
      for (int col = 0 ; col < boardWidth ; col ++)
      {
        int count = countNeighboursWithLoop(row, col);
        /*int count1 = countNeighboursWithLoop(row, col);
        println(count + "\t" + count1);
        */
        next[row][col] = false;
        if (board[row][col])
        {
          if (count<2)
          {
            next[row][col] = false;
          } 
          else if ((count == 2) || (count == 3))
          {
            next[row][col] = true;
          }
          else if (count > 3)
          {
            next[row][col] = false;
          }
        }
        else
        {
          if (count == 3)
          {
            next[row][col] = true;
          }
        }
      }
    }
    boolean[][] temp = board;
  board = next;
  next = temp;
  }  
}

float fps = 2;
int frames = (int) ((1.0f / fps) * 60.0f);
float t = 0.0f;
float tInc = 1.0f / frames;
color filledColor;
color backColor;

color targetFilledColor;
color targetBackColor;

void draw()
{
  background(c);
  
  if (frameCount % 240 == 0)
  {
    targetFilledColor = color(random(200, 255), random(200, 255), random(0, 50));
    targetBackColor = color(random(0, 100), random(20, 50), random(0, 50));
  }
  
  filledColor = lerpColor(filledColor, targetFilledColor, 0.05f);
  backColor = lerpColor(backColor, targetBackColor, 0.05f);
  
  if (! paused)
  {
    if (frameCount % frames == 0)
    {
      update();
      t = 0;
      noStroke();
    }
    for (int row = 0 ; row < boardHeight ; row ++)
    {
      for (int col = 0 ; col < boardWidth ; col ++)
      {
        float x = cellWidth * col;
        float y = cellHeight * row;
        
        color lerpedColor;
        //rect(x, y, cellWidth, cellHeight);
        if (board[row][col])
         {
           if (!next[row][col])
           {
             lerpedColor = lerpColor(backColor, filledColor, t);
           }
           else
           {
             lerpedColor = filledColor;
           }                         
         } 
         else
         {
            if (next[row][col])
           {
             lerpedColor = lerpColor(filledColor, backColor, t);
           }
           else
           {
             lerpedColor = backColor;
           } 
         }
         fill(lerpedColor);
         ellipse(x + cellWidth / 2, y + cellHeight / 2, cellWidth-1, cellHeight-1);
      }          
    } 
    t += tInc;
  }
}
void setup()
{
 size(500,500);
 cellWidth = width/ (float)colCount;
 cellHeight = height/ (float)rowCount;
 
 /*toggle(0,5,true);
 toggle(1,6,true);
 toggle(5,2,true);
 */
 randomise();
}

void toggle(int row,int col, boolean alive)
{
 if( row < rowCount && row > 0 && col < colCount && col > 0)
 {
   board[row][col] = true; 
 }
}

boolean getCell(int row, int col)
{
 if( row < rowCount && row > 0 && col < colCount && col > 0)
 {
   return board[row][col];
 }
 else
 {
    return false; 
 }
}

int rowCount = 100; //rows 
int colCount = 100; //cols

float cellWidth;
float cellHeight;

boolean[][] board = new boolean[rowCount][colCount];

void randomise()
{
  for(int row = 0 ;row < rowCount ; row ++)
  {
    for(int col = 0 ; col < colCount ; col ++)
    {
      if (random(0, 1) < 0.5f)
      {
        toggle(row, col, true);
      }
    }
  }
}

int countLiveCells(int r, int c)
{
  int count = 0;
  for(int row = r - 1 ;row <= r+1 ; row ++)
  {
    for(int col = c - 1 ; col <= c+1 ; col ++)
    {
      if ((! (row == r && col == c)) && getCell(row, col))
      {
        count ++;
      }
    }
  }    
  return count;
}

void draw()
{
   stroke(128);
   /*
   
   Put code here to count the surrounding live cells for every cell on the board and apply the following rules:


   if the cell is alive
     if < 2 neighbours, the cell dies
     if 2 or 3 neighbours it survives
     if > 3 neighbours, it dies due to overcrowding
   if the cell is dead
     if it has exactly 3 neighbours it comes back to life
     
     You need to keep two boards
     You will need to read from the current board and update the next board
     and then swap them!
  */

 
 
   for(int i =0; i< rowCount; i++)
   {
     for(int j = 0; j< colCount; j++)
     {
       if(board[i][j])
       {
           fill(0, 255, 0);        
       }
       else
       {
         fill(0);
       }
       rect(j * cellWidth, i * cellHeight, cellWidth, cellHeight);
     }
   }
}
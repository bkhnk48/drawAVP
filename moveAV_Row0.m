function [res] = moveAV_Row0(stack, row, column, v0)
  %%%==========Movement of AV[0, 0] - row 0, column 0===========
  deltaX = column*2*1.35;
  
  deltaY = (5 - (row + (1 - stack)*3))*5.4;
  [FirstTrajectory, lastT] = linearMovement(pi/2, v0, 0, (row + 1)*5.4/v0, 10 + 1.35 + deltaX, 
                                        10 + stack*10 + 2.7 + deltaY, 'r');
  
  res = FirstTrajectory;
endfunction

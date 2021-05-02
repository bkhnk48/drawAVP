function [res] = moveAV_Row0(stack, row, column, v0)
  %%%==========Movement of AV[0, 0] - row 0, column 0===========
  deltaX = column*2*1.35;
  
  deltaY = (5 - (row + (1 - stack)*3))*5.4;
  [FirstTrajectory, lastT] = linearMovement(pi/2, v0, 0, (row + 1)*5.4/v0, 10 + 1.35 + deltaX, 
                                        10 + stack*10 + 2.7 + deltaY);
  
  Radius = sqrt(1.35*1.35 + 6.7*6.7) ;%radius of circle trajectory (m)
  a0 = atan(1.35/6.7);%original angular (rad)

  XY = FirstTrajectory(:, columns(FirstTrajectory));
  x0 = XY(1, 1);
  y0 = XY(2, 1);
  xCenter = x0 - 6.7;
  yCenter = y0 - 1.35;

  [SecondTrajectory, lastT] = curveMovement(a0, pi/2, v0, lastT, x0, y0, 
                     xCenter, yCenter, Radius, 'r');
                      
  res = [FirstTrajectory, SecondTrajectory];
endfunction

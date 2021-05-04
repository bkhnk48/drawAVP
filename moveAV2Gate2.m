function [res] = moveAV2Gate2(stack, row, column, v0, otherCar)
  lastT = 0;
  res = [];
  WIDTH = 10 + 35*2.7 + 10;%width of car parking lot
  deltaX = column*2*1.35;
  
  deltaY = (5 - (row + (1 - stack)*3))*5.4;%stack tinh tu duoi len (!)
  
  if(column == 5)
    [ZeroTrajectory, lastT] = waitFor(0, 2.420377, 10 + 1.35 + deltaX, 
                                        10 + 2.7 + deltaY + 10, 0);
    [res] = [ZeroTrajectory];                                    
  endif;
  [FirstTrajectory, lastT] = linearMovement(-pi/2, v0, 0 + lastT, lastT + (3 - row)*5.4/v0, 10 + 1.35 + deltaX, 
                                        10 + 2.7 + deltaY + 10);
                                        
  Radius = sqrt(1.35*1.35 + 6.7*6.7) ;%radius of circle trajectory (m)
  a0 = atan(1.35/6.7);%original angular (rad)

  XY = FirstTrajectory(:, columns(FirstTrajectory));
  x0 = XY(1, 1);
  y0 = XY(2, 1);
  xCenter = x0 + 6.7;
  yCenter = y0 + 1.35;

  [SecondTrajectory, lastT] = curveMovement(a0 + pi, a0, pi/2, v0, lastT,  
                      xCenter, yCenter, Radius);
  XY = SecondTrajectory(:, columns(SecondTrajectory));
  x0 = XY(1, 1);
  y0 = XY(2, 1); 
  if(column == 5)
    printf("Last time of 2th trajectory: %f\n", lastT); 
  endif;
  %with colum = 7, the lastT is 2.420377
  
  [ThirdTrajectory, lastT] = linearMovement(0, v0, lastT, lastT + (WIDTH - x0)/v0, x0, 
                                        y0);  
  res = [res, FirstTrajectory, SecondTrajectory, ThirdTrajectory];
  if(rows(otherCar) != 0 && columns(otherCar) != 0)
    [res] = merge(otherCar, res);
  endif;
endfunction

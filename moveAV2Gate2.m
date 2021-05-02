function [res] = moveAV2Gate2(stack, row, column, v0, otherCar)
  WIDTH = 10 + 35*2.7 + 10;%width of car parking lot
  deltaX = column*2*1.35;
  
  deltaY = (5 - (row + (1 - stack)*3))*5.4;%stack tinh tu duoi len (!)
  [FirstTrajectory, lastT] = linearMovement(-pi/2, v0, 0, (3 - row)*5.4/v0, 10 + 1.35 + deltaX, 
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
  
  [ThirdTrajectory, lastT] = linearMovement(0, v0, lastT, lastT + (WIDTH - x0)/v0, x0, 
                                        y0);  
  res = [FirstTrajectory, SecondTrajectory, ThirdTrajectory];
  col2 = columns(res);
  col1 = columns(otherCar);
  
  n = abs(col1 - col2);
  if( n != 0)
    u = [0]; 
    u = repelem(u, n);
    u = u';
    v = [-1];
    v = repelem(v, n);
    v = v';
    u = [u; u; u; v];
    if(col2 < col1)
      res = [res, u];
    elseif
      otherCar = [otherCar, u];
    endif
  endif;
  res = [otherCar; res];
endfunction

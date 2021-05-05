function [res] = moveAV2Gate2(stack, row, column, v0, otherCar)
  lastT = 0;
  res = [];
  [WIDTH, HEIGHT, Radius, a0] = configuration();
  deltaX = column*2*1.35;
  deltaY = (5 - (row + (1 - stack)*3))*5.4;%stack tinh tu duoi len (!)
    
  %====Movement of AV in stack 1, row 2====
  if(stack == 1 && row == 2)
    if(column == 5)
      [ZeroTrajectory, lastT] = waitFor(0, 3.420377, 10 + 1.35 + deltaX, 
                                          10 + 2.7 + deltaY + 10, 0);
      [res] = [ZeroTrajectory];                                    
    endif;
    [FirstTrajectory, lastT, x0, y0] = linearMovement(-pi/2, v0, 0 + lastT, lastT + (3 - row)*5.4/v0, 10 + 1.35 + deltaX, 
                                          10 + 2.7 + deltaY + 10);
                                          
    xCenter = x0 + 6.7;
    yCenter = y0 + 1.35;

    [SecondTrajectory, lastT, x0, y0] = curveMovement(a0 + pi, a0, pi/2, v0, lastT,  
                        xCenter, yCenter, Radius);
    
    [ThirdTrajectory, lastT, x0, y0] = linearMovement(0, v0, lastT, lastT + (WIDTH - x0 + 2.7)/v0, x0, 
                                          y0);  
    res = [res, FirstTrajectory, SecondTrajectory, ThirdTrajectory];
  endif;
  
  
  %====Movement of AV in stack 1, row 1====
  if(stack == 1 && row == 1)
    waitingTime = 0.3 + 5.84 - (2*5.4/v0) ;
    [ZeroTrajectory, lastT] = waitFor(0, waitingTime, 10 + 1.35 + deltaX, 
                                          10 + 2.7 + deltaY + 10, 0);
    [res] = [ZeroTrajectory];     
    
    [FirstTrajectory, lastT, x0, y0] = linearMovement(-pi/2, v0, 0 + lastT, lastT + (2*5.4/v0), 10 + 1.35 + deltaX, 
                                          10 + 2.7 + deltaY + 10);
    xCenter = x0 + 6.7;
    yCenter = y0 + 1.35; 

    [SecondTrajectory, lastT, x0, y0] = curveMovement(a0 + pi, a0, pi/2, v0, lastT,  
                        xCenter, yCenter, Radius);
    
    [ThirdTrajectory, lastT, x0, y0] = linearMovement(0, v0, lastT, lastT + (WIDTH - x0 + 2.7)/v0, x0, 
                                          y0);  
    res = [res, FirstTrajectory, SecondTrajectory, ThirdTrajectory];
                                   
  endif;
  
  if(rows(otherCar) != 0 && columns(otherCar) != 0)
    [res] = merge(otherCar, res);
  endif;
endfunction

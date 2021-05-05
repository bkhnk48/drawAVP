function [res] = moveAV2Gate1(stack, row, column, v0, otherCar)
  lastT = 0;
  res = [];
  deltaX = column*2*1.35;
  deltaY = (5 - (row + (1 - stack)*3))*5.4;%stack tinh tu duoi len (!)
  
  [WIDTH, HEIGHT, Radius, a0] = configuration();
  %if(column == 1)
  %  [ZeroTrajectory, lastT] = waitFor(0, 4.840754, 10 + 1.35 + deltaX, 
  %                                      10 + 2.7 + deltaY + 10, 0);
  %  [res] = [ZeroTrajectory];                                    
  %endif;
  [FirstTrajectory, lastT] = linearMovement(-pi/2, v0, 0 + lastT, lastT + (3 - row)*5.4/v0, 10 + 1.35 + deltaX, 
                                        10 + 2.7 + deltaY + 10);
  
  XY = FirstTrajectory(:, columns(FirstTrajectory));
  x0 = XY(1, 1);
  y0 = XY(2, 1);
  xCenter = x0 + 6.7;
  yCenter = y0 + 1.35;

  [SecondTrajectory, lastT, x0, y0] = curveMovement(a0 + pi, a0, pi/2, v0, lastT,  
                      xCenter, yCenter, Radius);
  %XY = SecondTrajectory(:, columns(SecondTrajectory));
  %x0 = XY(1, 1);
  %y0 = XY(2, 1); 
    
  [ThirdTrajectory, lastT] = linearMovement(0, v0, lastT, lastT + (WIDTH + 1.8 - 10 - x0)/v0, x0, 
                                        y0);  
  res = [res, FirstTrajectory, SecondTrajectory, ThirdTrajectory];
  
  XY = ThirdTrajectory(:, columns(ThirdTrajectory));
  x0 = XY(1, 1);
  y0 = XY(2, 1);
  xCenter = x0 - 1.35;
  yCenter = y0 + 6.7;
  
  [ForthTrajectory, lastT, x0, y0] = curveMovement(a0 - (pi/2), a0, pi/2, v0, lastT,  
                      xCenter, yCenter, Radius);
  res = [res, ForthTrajectory];
  
  %XY = ForthTrajectory(:, columns(ForthTrajectory));
  %x0 = XY(1, 1);
  %y0 = XY(2, 1);
  
  [FifthTrajectory, lastT] = linearMovement(pi/2, v0, lastT, lastT + (HEIGHT + 1.35 - 10 - y0)/v0, x0, 
                                        y0); 
  res = [res, FifthTrajectory];
  
  
  XY = FifthTrajectory(:, columns(FifthTrajectory));
  x0 = XY(1, 1);
  y0 = XY(2, 1);
  xCenter = x0 - 6.7;
  yCenter = y0 - 1.35;
  
  [SixthTrajectory, lastT, x0, y0] = curveMovement(a0, a0, pi/2, v0, lastT,  
                      xCenter, yCenter, Radius);
  res = [res, SixthTrajectory];
  
  %XY = SixthTrajectory(:, columns(SixthTrajectory));
  %x0 = XY(1, 1);
  %y0 = XY(2, 1);
  
  [SeventhTrajectory, lastT] = linearMovement(pi, v0, lastT, lastT + (x0 - (WIDTH/2) - (2.7*4))/v0, x0, 
                                        y0); 
  res = [res, SeventhTrajectory];
  
  XY = SeventhTrajectory(:, columns(SeventhTrajectory));
  x0 = XY(1, 1);
  y0 = XY(2, 1);
  xCenter = x0 + 1.35;
  yCenter = y0 + 6.7;
  
  [EighthTrajectory, lastT, x0, y0] = curveMovement(-a0 + 3*(pi/2), -a0, -pi/2, v0, lastT,  
                      xCenter, yCenter, Radius);
  res = [res, EighthTrajectory];
  
  %XY = EighthTrajectory(:, columns(EighthTrajectory));
  %x0 = XY(1, 1);
  %y0 = XY(2, 1);
  
  [NinethTrajectory, lastT] = linearMovement(pi/2, v0, lastT, lastT + (2.7/v0), x0, 
                                        y0); 
  res = [res, NinethTrajectory];
  
  if(rows(otherCar) != 0 && columns(otherCar) != 0)  
    [res] = merge(otherCar, res);
  endif;
endfunction

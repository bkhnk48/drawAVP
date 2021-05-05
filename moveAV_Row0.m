function [res] = moveAV_Row0(stack, row, column, v0, otherAV)
  deltaX = column*2*1.35;
  deltaY = (5 - (row + (1 - stack)*3))*5.4;
  
  [WIDTH, HEIGHT, Radius, a0] = configuration();
    
  if(stack == 1 && row == 0 && column == 0)
    %%%==========Movement of AV[1, 0, 0] - stack 1, row 0, column 0===========
    
    [FirstTrajectory, lastT, x0, y0] = linearMovement(pi/2, v0, 0, (row + 1)*5.4/v0, 10 + 1.35 + deltaX, 
                                          10 + stack*10 + 2.7 + deltaY);
    
    xCenter = x0 - 6.7;
    yCenter = y0 - 1.35;

    [SecondTrajectory, lastT, x0, y0] = curveMovement(a0, a0, pi/2, v0, lastT, 
                       xCenter, yCenter, Radius);
                       
    %XY = SecondTrajectory(:, columns(SecondTrajectory));
    %x0 = XY(1, 1);
    %y0 = XY(2, 1);                  
    
    [ThirdTrajectory, lastT, x0, y0] = linearMovement(0, v0, lastT, lastT + 0.73, x0, y0); 
   
    xCenter = x0 + 1.35;
    yCenter = y0 - 6.7;
    printf("Turn left at x0 = %f, y0 = %f\n", x0, y0);

    [FourthTrajectory, lastT, x0, y0] = curveMovement(a0 + (pi/2), a0, pi/2, v0, lastT, 
                       xCenter, yCenter, Radius); 
    
    res = [FirstTrajectory, SecondTrajectory, ThirdTrajectory, FourthTrajectory];
    
    [FifthTrajectory, lastT, x0, y0] = linearMovement(-pi/2, v0, lastT, lastT + 6.5, x0, y0);
    
    res = [res, FifthTrajectory];
    
    xCenter = x0 + 6.7;
    yCenter = y0 + 1.35;
    
    [SixthTrajectory, lastT, x0, y0] = curveMovement(a0 + pi, a0, pi/2, v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, SixthTrajectory];
    
    %XY = SixthTrajectory(:, columns(SixthTrajectory));
    %x0 = XY(1, 1);
    %y0 = XY(2, 1);
    
    [SeventhTrajectory, lastT, x0, y0] = linearMovement(0, v0, lastT, lastT + 5.5, x0, y0); 
    res = [res, SeventhTrajectory];
    
    xCenter = x0 - 1.35;
    yCenter = y0 - 6.7;
    
    [EighthTrajectory, lastT, x0, y0] = curveMovement(-a0 + pi/2, -a0, -pi/2 , v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, EighthTrajectory];
    
    [NinethTrajectory, lastT, x0, y0] = linearMovement(-pi/2, v0, lastT, lastT + (2.7/v0), x0, 
                                        y0); 
    res = [res, NinethTrajectory];
  elseif(stack == 1 && row == 0 && (column == 2))
    waitingTime = 4.650755;
    
    %%%==========Movement of AV[1, 0, 2] - stack 1, row 0, column 2===========
    [FirstTrajectory, lastT] = waitFor(0, waitingTime, 10 + 1.35 + deltaX, 
                                          10 + stack*10 + 2.7 + deltaY, 0);
    res = [FirstTrajectory];
    
    [SecondTrajectory, lastT, x0, y0] = linearMovement(pi/2, v0, lastT, lastT + ((row + 1)*5.4/v0), 10 + 1.35 + deltaX, 
                                          10 + stack*10 + 2.7 + deltaY);
    res = [res, SecondTrajectory];
    
    xCenter = x0 - 6.7;
    yCenter = y0 - 1.35;

    [ThirdTrajectory, lastT, x0, y0] = curveMovement(a0, a0, pi, v0, lastT, 
                       xCenter, yCenter, Radius);
    
    res = [res, ThirdTrajectory];         
  
    
    [ForthTrajectory, lastT, x0, y0] = linearMovement(-pi/2, v0, lastT, lastT + 6.5, x0, y0);
    res = [res, ForthTrajectory];  
    
    xCenter = x0 + 6.7;
    yCenter = y0 + 1.35;
    
    [FifthTrajectory, lastT, x0, y0] = curveMovement(a0 + pi, a0, pi/2, v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, FifthTrajectory];

    [SixthTrajectory, lastT, x0, y0] = linearMovement(0, v0, lastT, lastT + 5.5, x0, y0); 
    res = [res, SixthTrajectory];
    
    xCenter = x0 - 1.35;
    yCenter = y0 - 6.7;
    
    [SeventhTrajectory, lastT, x0, y0] = curveMovement(-a0 + pi/2, -a0, -pi/2 , v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, SeventhTrajectory];
    
    [EighthTrajectory, lastT, x0, y0] = linearMovement(-pi/2, v0, lastT, lastT + (2.7/v0), x0, 
                                        y0); 
    res = [res, EighthTrajectory];

  else
    res = [0];
  endif;
  
  if(stack == 1 && row == 0 && (column == 7 || column == 8 || column == 5))
    if(column == 7)
      waitingTime = 4.650755;
    elseif(column == 8)
      waitingTime = 8.681510;
    elseif(column == 5)
      waitingTime = 13.611887;%la thoi gian AV (row = 0, col = 8) re trai xuong
    endif;
    [FirstTrajectory, lastT] = waitFor(0, waitingTime, 10 + 1.35 + deltaX, 
                                          10 + stack*10 + 2.7 + deltaY, 0);
    res = [FirstTrajectory];
    
    [SecondTrajectory, lastT, x0, y0] = linearMovement(pi/2, v0, lastT, lastT + ((row + 1)*5.4/v0), 10 + 1.35 + deltaX, 
                                          10 + stack*10 + 2.7 + deltaY);
    res = [res, SecondTrajectory];
    
    xCenter = x0 - 6.7;
    yCenter = y0 - 1.35;

    [ThirdTrajectory, lastT, x0, y0] = curveMovement(a0, a0, pi/2, v0, lastT, 
                       xCenter, yCenter, Radius);
    
    res = [res, ThirdTrajectory];         
  
    %8.166667 la gia tri cua x0, noi ma xe AV1 (row 0, col 0) re trai de di xuong
    [ForthTrajectory, lastT, x0, y0] = linearMovement(pi, v0, lastT, lastT + (abs( 8.166667 - x0)/v0), x0, y0);
    res = [res, ForthTrajectory];  
    
    xCenter = x0 + 1.35;
    yCenter = y0 - 6.7;
    
    %if(column == 8)
    %  printf("time of this moment: %f\n", lastT);
    %endif;
    [FifthTrajectory, lastT, x0, y0] = curveMovement(a0 + (pi/2), a0, pi/2, v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, FifthTrajectory];

    [SixthTrajectory, lastT, x0, y0] = linearMovement(-pi/2, v0, lastT, lastT + 6.5, x0, y0); 
    res = [res, SixthTrajectory];
    
    xCenter = x0 + 6.7;
    yCenter = y0 + 1.35;
    
    [SeventhTrajectory, lastT, x0, y0] = curveMovement(a0 + pi, a0, pi/2, v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, SeventhTrajectory];
    
    [EighthTrajectory, lastT, x0, y0] = linearMovement(0, v0, lastT, lastT + 5.5, x0, y0); 
    res = [res, EighthTrajectory];
    
    xCenter = x0 - 1.35;
    yCenter = y0 - 6.7;
    
    [NinethTrajectory, lastT, x0, y0] = curveMovement(-a0 + pi/2, -a0, -pi/2 , v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, NinethTrajectory];
    
    [TenthTrajectory, lastT, x0, y0] = linearMovement(-pi/2, v0, lastT, lastT + (2.7/v0), x0, 
                                        y0); 
    res = [res, TenthTrajectory];
  endif;
  
  if(rows(res) != 0 && columns(res) != 0)
    if(rows(otherAV) != 0 && columns(otherAV) != 0)
      res = merge(otherAV, res);
    endif;
  else
    res = [otherAV];
  endif;
  
endfunction

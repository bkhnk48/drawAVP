function [res] = moveAV_Row0(stack, row, column, v0, otherAV)
  deltaX = column*2*1.35;
  deltaY = (5 - (row + (1 - stack)*3))*5.4;
  
  [WIDTH, HEIGHT, Radius, a0] = configuration();
    
  if(stack == 1 && row == 0 && column == 0)
    %%%==========Movement of AV[1, 0, 0] - stack 1, row 0, column 0===========
    
    [FirstTrajectory, lastT] = linearMovement(pi/2, v0, 0, (row + 1)*5.4/v0, 10 + 1.35 + deltaX, 
                                          10 + stack*10 + 2.7 + deltaY);
    
    XY = FirstTrajectory(:, columns(FirstTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    xCenter = x0 - 6.7;
    yCenter = y0 - 1.35;

    [SecondTrajectory, lastT] = curveMovement(a0, a0, pi/2, v0, lastT, 
                       xCenter, yCenter, Radius);
                       
    XY = SecondTrajectory(:, columns(SecondTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);                  
    
    [ThirdTrajectory, lastT] = linearMovement(0, v0, lastT, lastT + 0.73, x0, y0); 
   
    XY = ThirdTrajectory(:, columns(ThirdTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    %printf("AV1: Prepare for curve: (%f, %f)\n", x0, y0);
    xCenter = x0 + 1.35;
    yCenter = y0 - 6.7;

    [FourthTrajectory, lastT] = curveMovement(a0 + (pi/2), a0, pi/2, v0, lastT, 
                       xCenter, yCenter, Radius); 
    
    res = [FirstTrajectory, SecondTrajectory, ThirdTrajectory, FourthTrajectory];
    XY = FourthTrajectory(:, columns(FourthTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    
    [FifthTrajectory, lastT] = linearMovement(-pi/2, v0, lastT, lastT + 6.5, x0, y0);
    
    res = [res, FifthTrajectory];
    
    XY = FifthTrajectory(:, columns(FifthTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    xCenter = x0 + 6.7;
    yCenter = y0 + 1.35;
    
    [SixthTrajectory, lastT] = curveMovement(a0 + pi, a0, pi/2, v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, SixthTrajectory];
    
    XY = SixthTrajectory(:, columns(SixthTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    
    [SeventhTrajectory, lastT] = linearMovement(0, v0, lastT, lastT + 5.5, x0, y0); 
    res = [res, SeventhTrajectory];
    
    XY = SeventhTrajectory(:, columns(SeventhTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    xCenter = x0 - 1.35;
    yCenter = y0 - 6.7;
    
    [EighthTrajectory, lastT] = curveMovement(-a0 + pi/2, -a0, -pi/2 , v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, EighthTrajectory];
  elseif(stack == 1 && row == 0 && column == 2)
    %%%==========Movement of AV[1, 0, 2] - stack 1, row 0, column 2===========
    [FirstTrajectory, lastT] = waitFor(0, 4.650755, 10 + 1.35 + deltaX, 
                                          10 + stack*10 + 2.7 + deltaY, 0);
    res = [FirstTrajectory];
    
    [SecondTrajectory, lastT] = linearMovement(pi/2, v0, 0, (row + 1)*5.4/v0, 10 + 1.35 + deltaX, 
                                          10 + stack*10 + 2.7 + deltaY);
    res = [res, SecondTrajectory];
    
    XY = SecondTrajectory(:, columns(SecondTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    xCenter = x0 - 6.7;
    yCenter = y0 - 1.35;

    [ThirdTrajectory, lastT] = curveMovement(a0, a0, pi, v0, lastT, 
                       xCenter, yCenter, Radius);
    res = [res, ThirdTrajectory];         
  
    XY = ThirdTrajectory(:, columns(ThirdTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    %printf("AV2: Prepare for 1/2 curve: (%f, %f)\n", x0 + 6.7, y0 + 6.7 );

    [ForthTrajectory, lastT] = linearMovement(-pi/2, v0, lastT, lastT + 6.5, x0, y0);
    res = [res, ForthTrajectory];  
    
    XY = ForthTrajectory(:, columns(ForthTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    xCenter = x0 + 6.7;
    yCenter = y0 + 1.35;
    
    [FifthTrajectory, lastT] = curveMovement(a0 + pi, a0, pi/2, v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, FifthTrajectory];

    XY = FifthTrajectory(:, columns(FifthTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    
    [SixthTrajectory, lastT] = linearMovement(0, v0, lastT, lastT + 5.5, x0, y0); 
    res = [res, SixthTrajectory];
    
    XY = SixthTrajectory(:, columns(SixthTrajectory));
    x0 = XY(1, 1);
    y0 = XY(2, 1);
    xCenter = x0 - 1.35;
    yCenter = y0 - 6.7;
    
    [SeventhTrajectory, lastT] = curveMovement(-a0 + pi/2, -a0, -pi/2 , v0, lastT, xCenter, yCenter, Radius); 
    
    res = [res, SeventhTrajectory];
    %[FifthTrajectory, lastT] = curveMovement(a0 + (pi/2), a0, pi/2, v0, lastT, 
    %                   xCenter, yCenter, Radius);   
    %res = [res, FifthTrajectory];  
  else
    res = [0];
  endif;
  if(rows(res) != 0 && columns(res) != 0)
    if(rows(otherAV) != 0 && columns(otherAV) != 0)
      res = merge(otherAV, res);
    endif;
  else
    res = [otherAV];
  endif;
  
endfunction

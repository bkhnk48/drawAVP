function res = moveAV_Row0(row, column, v0)
  %%%==========Movement of AV[0, 0] - row 0, column 0===========
  deltaX = column*2*1.35;
  
  deltaY = row*5.4;
  [x0, y0, lastT] = linearMovement(-pi/2, v0, 0, (row + 1)*5.4/v0, 10 + 1.35 + deltaX, 
                                        10 + 2.7 + deltaY, 'r');

  Radius = sqrt(1.35*1.35 + 6.7*6.7) ;%radius of circle trajectory (m)
  a0 = atan(1.35/6.7);%original angular (rad)

  xCenter = 10 + (2.7/2) - 6.7 + deltaX;
  yCenter = 10 - 1.35;

  hold on;
  plot(x0, y0, "-dk");

  [x0, y0, lastT] = curveMovement(-a0, -pi/2, v0, lastT, x0, y0, 
                      xCenter, yCenter, Radius, 'r');
  hold on;
  plot(x0, y0, "-dk");
  
  if(column == 0)
    [x0, y0, lastT] = linearMovement(0, v0, lastT, lastT + 0.6, x0, y0, 'r');
  elseif(column == 2)
    [x0, y0, lastT] = linearMovement(pi, v0, lastT, lastT + 0.2, x0, y0, 'r');
  elseif(column > 2)
    deltaT = (column - 2)*2.7/v0;
    [x0, y0, lastT] = linearMovement(pi, v0, lastT, lastT + 0.2 + deltaT, x0, y0, 'r');
  endif;

  hold on;
  plot(x0, y0, "-dk");

  xCenter = x0 + 1.35;
  yCenter = y0 + 6.7;

  [x0, y0, lastT] = curveMovement(-a0 - pi/2, -pi/2, v0, lastT, x0, y0, 
                      xCenter, yCenter, Radius, 'r');


  hold on;
  plot(x0, y0, "-dk");

  ForwardTime = 6.7;
  [x0, y0, lastT] = linearMovement(pi/2, v0, lastT, lastT + ForwardTime, x0, y0, 'r');

  hold on;
  plot(x0, y0, "-dk");
  xCenter = x0 + 6.7;
  yCenter = y0 - 1.35;


  [x0, y0, lastT] = curveMovement(-a0 + pi, -pi/2, v0, lastT, x0, y0, 
                      xCenter, yCenter, Radius, 'r');

  hold on;
  plot(x0, y0, "-dk");

  ForwardTime = 5.5;
  [x0, y0, lastT] = linearMovement(0, v0, lastT, lastT + ForwardTime, x0, y0, 'r');
  hold on;
  plot(x0, y0, "-dk");
  xCenter = x0 - 1.35;
  yCenter = y0 + 6.7;


  [x0, y0, lastT] = curveMovement(a0 - pi/2, pi/2, v0, lastT, x0, y0, 
                      xCenter, yCenter, Radius, 'k');
  %%%==========End of Movement of AV[0, 0] - row 0, column 0===========
  res = 0;
endfunction

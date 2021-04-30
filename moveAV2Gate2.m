function res = moveAV2Gate2(row, column, v0)
  WIDTH = 10 + 35*2.7 + 10;
  deltaX = column*2*1.35;
  
  deltaY = row*5.4;    
  [x0, y0, lastT] = linearMovement(pi/2, v0, 0, (3 - row)*5.4/v0, 10 + 1.35 + deltaX, 
                                        10 + 2.7 + deltaY, 'b');
                                        
  Radius = sqrt(1.35*1.35 + 6.7*6.7) ;%radius of circle trajectory (m)
  a0 = atan(1.35/6.7);%original angular (rad)

  xCenter = x0 + 6.7;
  yCenter = y0 - 1.35;

  hold on;
  plot(x0, y0, "-dk");

  [x0, y0, lastT] = curveMovement(-a0 + pi, -pi/2, v0, lastT, x0, y0, 
                      xCenter, yCenter, Radius, 'b');
  hold on;
  plot(x0, y0, "-dk");        

  [x0, y0, lastT] = linearMovement(0, v0, lastT, lastT + (WIDTH - x0)/v0, x0, 
                                        y0, 'b');  
  res = 0;
endfunction
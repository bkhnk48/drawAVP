function [Coord, lastT] = curveMovement(a0, rotationA0, alpha, velocity, startTime, xCenter, yCenter, R)
  w0 = velocity / R;
  deltaT = abs(alpha)/w0;
  if(alpha < 0)
    w0 = -w0;
  endif;
  t = linspace(startTime, startTime + deltaT, round(deltaT*24));  
  a = a0 + w0*(t - startTime);
  x = xCenter + R*cos(a);
  y = yCenter + R*sin(a);
  a = a - rotationA0;
  Coord = [x; y; a; t];
  lastT = startTime + deltaT;
endfunction

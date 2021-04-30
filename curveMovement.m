function [lastestX, lastestY, lastT] = curveMovement(a0, alpha, velocity, startTime, x0, y0, xCenter, yCenter, R, color)
  w0 = velocity / R;
  deltaT = abs(alpha)/w0;
  if(alpha < 0)
    w0 = -w0;
  endif;
  t = linspace(startTime, startTime + deltaT, round(deltaT*24));  
  a = a0 + w0*(t - startTime);
  x = xCenter + R*cos(a);
  y = yCenter + R*sin(a);
  hold on;
  plot(x, y, color);
  lastestX = x(length(x));
  lastestY = y(length(y));
  lastT = startTime + deltaT;
endfunction

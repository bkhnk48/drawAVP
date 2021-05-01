function [Coord, lastT] = linearMovement(alpha, velocity, startTime, endTime, x0, y0, color)
  t = linspace(startTime, endTime, round((endTime - startTime)*24));
  x = x0 + velocity*(t - startTime)*cos(alpha);
  y = y0 + velocity*(t - startTime)*sin(alpha);
  
  Coord = [x; y];
  lastT = endTime;
 endfunction

function [Coord, lastT] = linearMovement(alpha, velocity, startTime, endTime, x0, y0)
  t = linspace(startTime, endTime, round((endTime - startTime)*24));
  x = x0 + velocity*(t - startTime)*cos(alpha);
  y = y0 + velocity*(t - startTime)*sin(alpha);
  alpha = alpha - (pi/2);
  v = [alpha];
  v = repelem(v, length(y));
  v = v';
  Coord = [x; y; v];
  lastT = endTime;
 endfunction

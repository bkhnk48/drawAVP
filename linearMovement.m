function [lastestX, lastestY, lastT] = linearMovement(alpha, velocity, startTime, endTime, x0, y0, color)
  t = linspace(startTime, endTime, round((endTime - startTime)*24));
  x = x0 + velocity*(t - startTime)*cos(alpha);
  y = y0 + velocity*(t - startTime)*sin(alpha);
  hold on;
  plot(x, y, color);
  lastestX = x(length(x));
  lastestY = y(length(y));
  lastT = endTime;
 endfunction

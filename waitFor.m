%====waitFor====
function [Coord, lastT] = waitFor(startTime, endTime, x0, y0, alpha)
     t = linspace(startTime, endTime, round((endTime - startTime)*24));
     u = [x0];
     u = repelem(u, length(t));
     u = u’ ;
     v = [y0];
     v = repelem(v, length(t));
     v = v’ ;
     angle = [alpha];
     angle = repelem(angle , length(t));
     angle  = angle';
     Coord = [u; v; angle; t];
     lastT = endTime;
endfunction

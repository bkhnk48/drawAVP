function [WIDTH, HEIGHT, Radius, a0] = configuration()
  WIDTH = 10 + 35*2.7 + 10;%width of car parking lot
  HEIGHT = 30 + 5.4*6;
  
  Radius = sqrt(1.35*1.35 + 6.7*6.7) ;%radius of circle trajectory (m)
  a0 = atan(1.35/6.7);%original angular (rad)
endfunction;
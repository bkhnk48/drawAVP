function res = animate(Coord)
  j = 0;
  length = columns(Coord);
  height = rows(Coord);
  numOfAVs = height / 4;
  for i = 1: length
    XYA = Coord(:, 1);
    m = mod(i - 1, 4);
    if(%(i <= 20) && 
      %(i >= 170) &&
      (m == 0 || i == length))
      %graphics_toolkit('gnuplot');
      figure(j + 1);
      hold on;
      
      temp = init();
      axis([-15 130 -15 70], 'equal');%expand minimum of X, Y
      for k = 1 : numOfAVs
        X = XYA(4*(k - 1) + 1, 1);
        Y = XYA(4*(k - 1) + 2, 1);
        theta = XYA(4*(k - 1) + 3, 1);
        t = XYA(4*(k - 1) + 4, 1);
        if(t >= 0)
          printf("%d)[%f %f %f]  ", i, X, Y, theta);
          printf("X;  ");
          
          R = [ cos(theta)    -sin(theta) ; sin(theta)     cos(theta) ] ;
          
          D = [(-1.35) (1.35) (1.35) (-1.35) (-1.35); (-2.7) (-2.7) (2.7) (2.7) (-2.7)];
          D1 = R*D;
          D1 = D1 + [X X X X X; Y Y Y Y Y];
          x = D1(1, :);
          y = D1(2, :);
          color = colorOfCar(k);
          hold on;
          plot(x, y, color);
        endif;
      end;        
      
      
      %view(0, -90);
      title ("Automated Valet Parking v = 24km/h");
      %graphics_toolkit('gnuplot');
      text = sprintf("AVP%d.png", j);
      saveas(gca, text);
      j = j + 1;
      printf("\n");
    endif;
    Coord(:, 1) = [];
    
  end
  res = 0;
endfunction

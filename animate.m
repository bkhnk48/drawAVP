function res = animate(Coord)
  j = 0;
  length = columns(Coord)
  for i = 1: length
    XYA = Coord(:, 1);
    
    X = XYA(1, 1);
    Y = XYA(2, 1);
    theta = XYA(3, 1);
    printf("%d)[%f %f %f]  ", i, X, Y, theta);
    Coord(:, 1) = [];
    if(mod(i - 1, 4) == 0 || i == length)
      printf("X");
      graphics_toolkit('gnuplot');
      figure(j + 1);
      hold on;
      temp = init();
      R = [ cos(theta)    -sin(theta) ; sin(theta)     cos(theta) ] ;
      
      D = [(X - 1.35) (X + 1.35) (X + 1.35) (X - 1.35) (X - 1.35); (Y - 2.7) (Y - 2.7) (Y + 2.7) (Y + 2.7) (Y - 2.7)];
      D1 = R*D;
      x = D1(1, :);
      y = D1(2, :);
      
      axis([-15 130 -15 70]);%expand minimum of X, Y
      hold on;
      plot(x, y, 'r-');
      %view(0, -90);
      title ("Automated Valet Parking v = 24km/h");
      graphics_toolkit('gnuplot');
      text = sprintf("AVP%d.png", j);
      saveas(gca, text);
      j = j + 1;
    endif;
    printf("\n");
  end
  res = 0;
endfunction

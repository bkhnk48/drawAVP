function res = animate(Coord)
  j = 0;
  length = columns(Coord)
  for i = 1: length
    XY = Coord(:, 1);
    
    X = XY(1, 1);
    Y = XY(2, 1);
    printf("%d)[%f %f]  ", i, X, Y);
    Coord(:, 1) = [];
    if(mod(i - 1, 4) == 0 || i == length)
      printf("X");
      graphics_toolkit('gnuplot');
      figure(j + 1);
      hold on;
      temp = init();
      rectangle("Position", [X - 1.35, Y - 2.7, 2.7, 5.4], 
                "EdgeColor", [1, 0, 0]
                );
      axis([-15 130 -15 70]);%expand minimum of X, Y
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
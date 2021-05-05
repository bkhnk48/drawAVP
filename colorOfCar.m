function res = colorOfCar(index)
  color = 'r-';
  switch(index)
    case 1
      color = 'r-';
    case 2
      color = 'r-';
    case 3
      color = 'b-';
    case 4
      color = 'b-';
    case 5
      color = 'b-';
    case 6
      color = 'k-';
    case 7
      color = 'b-';
    %case 8, 9: color = 'r-';
  endswitch;
  res = color;
endfunction

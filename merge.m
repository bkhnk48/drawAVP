function [res] = merge(matrix1, matrix2)
  col1 = columns(matrix1);
  col2 = columns(matrix2);
  res = matrix1;
  
  n = abs(col1 - col2);
  if( n != 0)
    u = [0]; 
    u = repelem(u, n);
    u = u';
    v = [-1];
    v = repelem(v, n);
    v = v';
    u = [u; u; u; v];
    if(col2 < col1)
      matrix2 = [matrix2, u];
    else
      matrix1 = [matrix1, u];
    endif
  endif;
  res = [matrix1; matrix2];
  
endfunction  
function [res] = merge(matrix1, matrix2)
  col1 = columns(matrix1);
  col2 = columns(matrix2);
  res = matrix1;
  %nRows = max(rows(matrix1), rows(matrix2));
  
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
      appendMatrix = u;
      nRows = rows(matrix2) - 4;
      if(nRows > 1)
        for i = 1: (nRows/4)
          appendMatrix = [u; appendMatrix];
        endfor;
      endif;
      matrix2 = [matrix2, appendMatrix];
    else
      
      appendMatrix = u;
      nRows = rows(matrix1) - 4;
      if(nRows > 1)
        for i = 1: (nRows/4)
          appendMatrix = [u; appendMatrix];
        endfor;
      endif;
      matrix1 = [matrix1, appendMatrix];
    endif
  endif;
  res = [matrix1; matrix2];
  
endfunction  

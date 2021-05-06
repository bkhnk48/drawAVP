function res = closeAllFigs(images)
  if(columns(images) > 0)
    for i = 1: columns(images)
      img = images(1, i);
      close(img);
    endfor;
  endif;
  res = 0;
endfunction;
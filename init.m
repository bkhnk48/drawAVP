function res = init()
  %stack 0
  for i = 0: 34
    for j = 0: 2
      if(((j == 2) && (i == 0 || i == 2 || i == 4 || i == 7 || i == 8))
          || ((j == 1) && (i == 2 || i == 5))
        )
          %rectangle("Position", [10 + i*2.7, 10 + j*5.4, 2.7, 5.4], 
          %    "Edgecolor", [1, 0, 0]);
      elseif((j == 0) && (i == 1))
          %rectangle("Position", [10 + i*2.7, 10 + j*5.4, 2.7, 5.4], 
          %    "Edgecolor", [0, 0, 0]);
      elseif(((j == 0) && (i == 4 || i == 5 || i == 7))
              || (j == 1 && i == 7)
            )
          %rectangle("Position", [10 + i*2.7, 10 + j*5.4, 2.7, 5.4], 
          %    "Edgecolor", [0, 0, 1]);
      else
          rectangle("Position", [10 + i*2.7, 20 + (j + 3)*5.4, 2.7, 5.4],
              "Edgecolor", [0.93, 0.5, 0.93]);%violet
      endif;
    endfor;
endfor;

  %stack 1
  for i = 0: 34
    for j = 0: 2
       rectangle("Position", [10 + i*2.7, 10 + j*5.4, 2.7, 5.4],
              "Edgecolor", [0.93, 0.5, 0.93]);%violet
    endfor;
endfor;



  rectangle("Position", [0, 0, 10 + 2.7*35 + 10, 10 + 5.4*3 + 10 + 5.4*3 + 10 ]);
                        %boundary

  rectangle("Position", [10 + 2.7*17.5 - 10.4, -5, 20.8, 5 ], 
                          "Edgecolor", [1, 0, 0]);%Gate 1
  rectangle("Position", [10 + 2.7*35 + 10, 20.8, 5, 20.8 ], 
                          "Edgecolor", [0, 0, 1]);%Gate 2
  rectangle("Position", [10 + 2.7*17.5 - 10.4, 10 + 5.4*3 + 10 + 5.4*3 + 10, 20.8, 5 ], 
                          "Edgecolor", [0, 0, 0]);%Gate 3                        
  rectangle("Position", [-5, 20.8, 5, 20.8 ], "Edgecolor", 
                            [0.65, 0.16, 0.16]);%Gate 4
  res = 0;
endfunction                           

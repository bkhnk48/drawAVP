clf;
axis equal;


for i = 0: 34
    for j = 0: 2
      if(((j == 0) && (i == 0 || i == 2 || i == 4 || i == 7 || i == 8))
          || ((j == 1) && (i == 2 || i == 5))
        )
          rectangle("Position", [10 + i*2.7, 10 + j*5.4, 2.7, 5.4], 
              "Facecolor", [1, 0, 0]);
      elseif((j == 2) && (i == 1))
          rectangle("Position", [10 + i*2.7, 10 + j*5.4, 2.7, 5.4], 
              "Facecolor", [0, 0, 0]);
      elseif(((j == 2) && (i == 4 || i == 5 || i == 7))
              || (j == 1 && i == 7)
            )
          rectangle("Position", [10 + i*2.7, 10 + j*5.4, 2.7, 5.4], 
              "Facecolor", [0, 0, 1]);
      else
          rectangle("Position", [10 + i*2.7, 10 + j*5.4, 2.7, 5.4],
              "Facecolor", [1, 1, 0]);
      endif;
    endfor;
endfor;

for i = 0: 34
    for j = 0: 2
       rectangle("Position", [10 + i*2.7, 20 + (j + 3)*5.4, 2.7, 5.4],
              "Facecolor", [1, 1, 0]);
    endfor;
endfor;



rectangle("Position", [0, 0, 10 + 2.7*35 + 10, 10 + 5.4*3 + 10 + 5.4*3 + 10 ]);
                      %boundary

rectangle("Position", [10 + 2.7*17.5 - 10.4, -5, 20.8, 5 ], 
                        "Facecolor", [0, 0, 0]);%Gate 1
rectangle("Position", [10 + 2.7*35 + 10, 20.8, 5, 20.8 ], 
                        "Facecolor", [0, 0, 1]);%Gate 2
rectangle("Position", [10 + 2.7*17.5 - 10.4, 10 + 5.4*3 + 10 + 5.4*3 + 10, 20.8, 5 ], 
                        "Facecolor", [1, 0, 0]);%Gate 3                        
rectangle("Position", [-5, 20.8, 5, 20.8 ], "Facecolor", 
                          [0.65, 0.16, 0.16]);%Gate 4

v0 = 20/3;%(m/s)
t1 = linspace(0, 0.81, 800);%(s)
x = 10 + 1.35;%(m)
y = 10 + 2.7 - v0*t1;%(m)
hold on;%draw overlay some graphic objects
plot(x, y, 'r');

Radius = 6.8;%radius of circle trajectory (m)
w0 = v0 / Radius;%angular velocity (rad/s)
a0 = 0.2;%original angular (rad)

                         
axis([-15 130 -15 70]);%expand minimum of X, Y
view(0, -90);
title ("Automated valet parking v = 24km/h");

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
[x0, y0] = linearMovement(-pi/2, v0, 0, 0.81, 10 + 1.35, 10 + 2.7, 'r');

Radius = sqrt(1.35*1.35 + 6.7*6.7) ;%radius of circle trajectory (m)
w0 = v0 / Radius;%angular velocity (rad/s)
a0 = atan(1.35/6.7);%original angular (rad)
deltaT = (pi/2)/w0;
t = linspace(0.81, 0.81+deltaT, round(deltaT*24));
xCenter = 10 + (2.7/2) - 6.7;
yCenter = 10 - 1.35;
alpha = a0 + w0*(t - 0.81);
x = xCenter + Radius*cos(alpha);
y = yCenter - Radius*sin(alpha);
x0 = x(1);
y0 = y(1);
hold on;
plot(x0, y0, "-dk");
hold on;
plot(x, y, 'r');
x0 = x(length(x));
y0 = y(length(y));
hold on;
plot(x0, y0, "-dk");
lastT = 0.81 + deltaT;
t = linspace(lastT, lastT + 1, 24);
x = x0 + v0*(t - lastT);
hold on;
plot(x, y0, 'r');
hold on;
plot(x(length(x)), y0, "-dk");
xCenter = x(length(x));
yCenter = y0 + Radius;
lastT = lastT + 1;
t = linspace(lastT, lastT + deltaT, round(deltaT*24));
alpha = w0*(t - lastT);                  
x = xCenter - Radius*sin(alpha);
y = yCenter - Radius*cos(alpha);
hold on;
plot(x, y, 'r');
lastT = lastT + deltaT;
x0 = x(length(x));
y0 = y(length(y));
hold on;
plot(x0, y0, "-dk");
ForwardTime = 6.7;
t = linspace(lastT, lastT + ForwardTime, ForwardTime*24);
y = y0 + v0*(t - lastT);
hold on;
plot(x0, y, 'r');
y0 = y(length(y));
hold on;
plot(x0, y0, "-dk");
xCenter = x0 + Radius;
yCenter = y0;
lastT = lastT + ForwardTime;
t = linspace(lastT, lastT + deltaT, round(deltaT*24));
alpha = w0*(t - lastT);                  
x = xCenter - Radius*cos(alpha);
y = yCenter + Radius*sin(alpha);
hold on;
plot(x, y, 'r');
x0 = x(length(x));
y0 = y(length(y));
hold on;
plot(x0, y0, "-dk");
lastT = lastT + deltaT;
ForwardTime = 5.5;
t = linspace(lastT, lastT + ForwardTime, ForwardTime*24);
x = x0 + v0*(t - lastT);
hold on;
plot(x, y0, 'r');
x0 = x(length(x));
hold on;
plot(x0, y0, "-dk");
xCenter = x0;
yCenter = y0 + Radius;
lastT = lastT + ForwardTime;
t = linspace(lastT, lastT + deltaT, round(deltaT*24));
alpha = w0*(t - lastT);                  
x = xCenter + Radius*sin(alpha);
y = yCenter - Radius*cos(alpha);
hold on;
plot(x, y, 'k');
                  
axis([-15 130 -15 70]);%expand minimum of X, Y
%view(0, -90);
title ("Automated valet parking v = 24km/h");

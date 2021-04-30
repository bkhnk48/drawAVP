clf;
axis equal;


res = init();

v0 = 20/3;%(m/s)
[x0, y0, lastT] = linearMovement(-pi/2, v0, 0, 0.81, 10 + 1.35, 10 + 2.7, 'r');

Radius = sqrt(1.35*1.35 + 6.7*6.7) ;%radius of circle trajectory (m)
a0 = atan(1.35/6.7);%original angular (rad)

xCenter = 10 + (2.7/2) - 6.7;
yCenter = 10 - 1.35;

hold on;
plot(x0, y0, "-dk");

[x0, y0, lastT] = curveMovement(-a0, -pi/2, v0, lastT, x0, y0, 
                    xCenter, yCenter, Radius, 'r');
hold on;
plot(x0, y0, "-dk");
[x0, y0, lastT] = linearMovement(0, v0, lastT, lastT + 0.6, x0, y0, 'r');

hold on;
plot(x0, y0, "-dk");

xCenter = x0 + 1.35;
yCenter = y0 + 6.7;

[x0, y0, lastT] = curveMovement(-a0 - pi/2, -pi/2, v0, lastT, x0, y0, 
                    xCenter, yCenter, Radius, 'r');


hold on;
plot(x0, y0, "-dk");

ForwardTime = 6.7;
[x0, y0, lastT] = linearMovement(pi/2, v0, lastT, lastT + ForwardTime, x0, y0, 'r');

hold on;
plot(x0, y0, "-dk");
xCenter = x0 + 6.7;
yCenter = y0 - 1.35;


[x0, y0, lastT] = curveMovement(-a0 + pi, -pi/2, v0, lastT, x0, y0, 
                    xCenter, yCenter, Radius, 'r');

hold on;
plot(x0, y0, "-dk");

ForwardTime = 5.5;
[x0, y0, lastT] = linearMovement(0, v0, lastT, lastT + ForwardTime, x0, y0, 'r');
hold on;
plot(x0, y0, "-dk");
xCenter = x0 - 1.35;
yCenter = y0 + 6.7;


[x0, y0, lastT] = curveMovement(a0 - pi/2, pi/2, v0, lastT, x0, y0, 
                    xCenter, yCenter, Radius, 'k');

                  
axis([-15 130 -15 70]);%expand minimum of X, Y
%view(0, -90);
title ("Automated Valet Parking v = 24km/h");

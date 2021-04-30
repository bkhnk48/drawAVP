clf;
axis equal;


res = init();

v0 = 20/3;%(m/s)

%===movement of AV[0,0]===
res = moveAV_Row0(0, 0, v0);
                    
%===movement of AV[0,2]===
res = moveAV_Row0(0, 2, v0);

%===movement of AV[0,4]===
res = moveAV_Row0(0, 4, v0);

%===movement of AV[0,7]===
res = moveAV_Row0(0, 7, v0);

%===movement of AV[0,8]===
res = moveAV_Row0(0, 8, v0);

%===movement of AV[1,2]===
res = moveAV_Row0(1, 2, v0);

axis([-15 130 -15 70]);%expand minimum of X, Y
view(0, -90);
title ("Automated Valet Parking v = 24km/h");

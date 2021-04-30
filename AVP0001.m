clf;
axis equal;


res = init();

v0 = 20/3;%(m/s)

%===movement of AV[0,0]===
res = moveAV_0_0(v0);
                    
                  
axis([-15 130 -15 70]);%expand minimum of X, Y
view(0, -90);
title ("Automated Valet Parking v = 24km/h");

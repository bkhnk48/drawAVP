clf;
axis equal;


%res = init();

v0 = 20/3;%(m/s)
%figure(1);
%===movement of AV[0,0]===
[res1] = moveAV_Row0(1, 0, 0, v0, []);
                    
%===movement of AV[0,2]===
[res2] = moveAV_Row0(1, 0, 2, v0, res1);

%===movement of AV[0,4]===
%res = moveAV_Row0(0, 4, v0);

%===movement of AV[0,7]===
%res = moveAV_Row0(0, 7, v0);

%===movement of AV[0,8]===
%res = moveAV_Row0(0, 8, v0);

%===movement of AV[1,2]===
%res = moveAV_Row0(1, 2, v0);

%===movement of AV[2,4]===
%[res2] = moveAV2Gate2(1, 2, 4, v0);

%===movement of AV[2,5]===
[res3] = moveAV2Gate2(1, 2, 5, v0, res2);

%===movement of AV[1,7]===
[res4] = moveAV2Gate2(1, 2, 7, v0, res3);

ret = animate(res4);

clc;close all;clear all;

printf("Input Map\n");

RGB = imread('AVP.png');
figure('Position',[100 0 600 700],'color','k');
imagesc(RGB);
axis image
title('Input Map','color','w');
axis off
set(gcf, 'InvertHardCopy', 'off');
hold off;

printf("Convert to binary image matrix and inverse matrix values\n");

I = rgb2gray(RGB);
binaryImage = im2bw(RGB, 0.3);
sz  = size(binaryImage);

printf("Inital pose\n");

%xs = 10 + 1.35; ys = 10 + 3*5.4 + 10 + 2*5.4 + 2.7;
[WIDTH, HEIGHT, R, alpha] = configuration();
locStartedX = 10 + 1.35; locStartedY = 10 + 3*5.4 + 10 + 2*5.4 + 2.7;
%xs = round((locStartedX/WIDTH)*sz(2)) + 1; ys = round((locStartedY/HEIGHT)*sz(1)) + 1;
xs = round((locStartedX*534/WIDTH)) + 183; ys = 443 - round((locStartedY*290/HEIGHT));
% Goal Pose
%xg = 10 + 16*2.7 + 1.35; yg = 0;
locGoalX = 10 + 16*2.7 + 1.35; locGoalY = 0;
xg = round((locGoalX*534/WIDTH)) + 183; yg = 443 - round((locGoalY*290/HEIGHT));
printf("xs = %d, ys = %d  ===> xg = %d, yg = %d\n", xs, ys, xg, yg);
%xs = 225; ys = 355;
% Goal Pose
%xg = 50; yg = 50;
% Pose Matrix
pose = zeros(sz(1),sz(2));
pose(ys,xs) = 1;
pose(yg,xg) = 1;

printf("Voronoi Road Map\n");

figure('Position',[100 0 600 700],'color','k');
hold on;
set(gcf, 'InvertHardCopy', 'off');
sk = 1;
for i = 1:sz(1)
    for j = 1:sz(2)
         if(binaryImage(i,j) == 1 )
     xv(sk) = j;
     yv(sk) = i;
     sk = sk+1;
         end
    end
end
[vrx,vry]  = voronoi(xv,yv);
set(gca,'YDir','Reverse');
plot(xv,yv,'y.',vrx,vry,'b-');
axis tight
%axis([1 sz(2) 1 sz(1) ]) ;
axis image
title({'Voronoi Road Map';
'* - Represents Starting and Goal Position '},'color','w');
axis off
spy(pose,'*r');

printf("Robot Path\n");

x = xs; y = ys;
indk = 1;
while (abs(x - xg) > 5)||(abs(y - yg)> 5)
path(:,indk) = [x y];
dist = sqrt((vrx - x).^2+(vry - y).^2);
goal = sqrt((xg - x).^2+(xg - y).^2);
% Find closest vertices of the Voronoi edges
[mn ind] = min(dist(:));
xt = vrx(ind);
yt = vry(ind);
goalj = sqrt((xg - xt).^2+(xg - yt).^2);
if (goalj < goal )
x = xt;
y = yt;
vrx(ind) = 1E6;
vry(ind) = 1E6;
indk = indk +1;
else
vrx(ind) = 1E6;
vry(ind) = 1E6;
end
end
path(:,indk) = [xg yg];
plot(path(1,:),path(2,:),'-r');
title({'Voronoi Road Map and Robot Path';
'* - Represents Starting and Goal Position '},'color','w');

RGB = imread('AVP.png');
figure('Position',[100 0 600 700],'color','k');
imagesc(RGB);
axis image
title('Input Map','color','w');
axis off
set(gcf, 'InvertHardCopy', 'off');
hold off;
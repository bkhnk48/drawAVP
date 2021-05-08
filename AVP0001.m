clf;
axis equal;

figure('color', [0, 0, 0]);
res = init();
axis([-15 130 -15 70], 'equal');%expand minimum of X, Y
axis off;
set(gcf,'InvertHardCopy','off');
text = sprintf("AVP.png");
saveas(gca, text);

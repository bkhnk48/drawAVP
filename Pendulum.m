clear all
close all
clc
b = 0.05;
g = 9.81;
l = 1;
m = 0.1;
theta0 = [0; 5];
tspan = linspace(0, 20, 100);
[result] = lsode("callfunc", theta0, tspan);
figure(1);
%subplot(2, 1, 1);
%plot(tspan, result(:, 1), 'linewidth', 2, 'color', 'b');
ct = 1;
THETA = result(:, 1);
for i = 1:length(result(:, 1))
  THETA1 = THETA(i);
  x0 = 0;
  y0 = 0;
  x1 = l*sin(THETA1);
  y1 = -l*cos(THETA1);
  graphics_toolkit('gnuplot');
  figure(i + 1);
  plot([-0.5 0.5], [0 0], 'linewidth', 4, 'color', 'b');
  hold on;
  plot([x0 x1], [y0 y1], 'linewidth', 5, 'color', 'g');
  hold on;
  plot(x1, y1, 'marker', 'o', 'markersize', 20, 'markerfacecolor', 'y');
  hold on;
  grid on;
  axis([-2 2 -2 1.5]);
  graphics_toolkit('gnuplot');
  text = sprintf("pendulum%d.png", i);
  saveas(gca, text);
end
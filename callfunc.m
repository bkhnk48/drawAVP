function [dtheta_dt] = callfunc(theta, t, b, g, l, m)
  b = 0.05;
  g = 9.81;
  l = 1;
  m = 0.1;
  theta1_dt = theta(1);
  theta2_dt = theta(2);
  dtheta_dt1 = theta2_dt;
  dtheta_dt2 = (-(b/m)*theta2_dt) - ((g/l)*sin(theta1_dt)) ;
  dtheta_dt = [dtheta_dt1; dtheta_dt2];
end  
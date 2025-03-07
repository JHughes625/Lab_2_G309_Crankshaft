function [v_mod] = LCSMODEL(r,d,l,w,theta)
w = w*pi/180;
theta = theta*pi/180;
beta = asin((d - r .* sin(theta)) / l);
v_mod = (w .* r .* (-sin(theta) - cos(theta).*tan(beta)))*100;
end

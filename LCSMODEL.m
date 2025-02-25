function [v_mod] = LCSMODEL(r,d,l,theta,w)

beta = asind((d-sind(theta))/l);

v_mod = w * r * (-sind(theta) + tand(beta));

end
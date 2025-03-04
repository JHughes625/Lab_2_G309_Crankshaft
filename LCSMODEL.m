function [v_mod] = LCSMODEL(r,d,l,w)
theta = linspace(0,2160,length(w));
beta = asind((d - r .* sind(theta)) / l);

v_mod = w .* r .* (-sind(theta) + cosd(theta).*tand(beta));

end

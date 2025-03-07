%% Input
%filename vector

function[theta, w, v, t] = readData(filename)
    %read file
    data = readmatrix(filename);
    %find low point
    start = find(data(:,3) < .3, 1, 'first');
    
    %cleaning
    data(1:start-1,:) = [];
    theta0 = data(1,2);
    data(:,2) = data(:,2) - theta0 + 152.2;
    time0 = data(1,1);
    data(:,1) = data(:,1) - time0;
    
    %outputs
    theta = data(:,2);
    w = data(:,4);
    v = data(:,5)/10;
    t = data(:,1);
end

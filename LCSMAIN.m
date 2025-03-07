% ASEN2803 Group 3-09
% 

clear all;
close all;
clc;

%read and store data
filenames = ["Test1_5pt5V", "Test1_6pt5V", "Test1_7pt5V", "Test1_8pt5V", "Test1_9pt5V", "Test1_10pt5V"];
fignames = ["5.5V Case", "6.5V Case", "7.5V Case", "8.5V Case", "9.5V Case", "10.5V Case"];
theta_exp = {};
w_exp = {};
v_exp = {};
t_exp = {};
for i = 1:6
    [theta_exp{i}, w_exp{i}, v_exp{i}, t_exp{i}] = readData(filenames(i));
end

%run model
r_Theo = .075; l_Theo = .26; d_Theo = .155; %[m]
v_mod = {};
for i = 1:6
  v_mod{i} = LCSMODEL(r_Theo,d_Theo,l_Theo,w_exp{i},theta_exp{i});
end

%plot mod. vs exp.
for i = 1:6
    figure()
    plot(theta_exp{i},v_mod{i})
    hold on
    plot(theta_exp{i}, v_exp{i})
    legend('model', 'data')
    xlim([152.5 2312.5])
    ylim([-200 220])
    xlabel('Angle (degrees)')
    ylabel('Velocity (cm/s)')
    title('Slide Velocity wrt Theta', fignames(i))
    hold off
end

%residuals
error = {};
for i = 1:6
    error{i} = v_mod{i} - v_exp{i};
    figure()
    plot(t_exp{i}, error{i})
    xlabel('Time (s)')
    ylabel('Velocity Error (cm/s)')
    title('Velocity Error wrt Time', fignames(i))
    Average(i) = mean(error{i});
    Standard_Dev(i) = std(error{i});
end

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
figure();
for i = 1:6
    subplot(2,3,i);
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
figure();
for i = 1:6
    subplot(2,3,i);
    error{i} = v_mod{i} - v_exp{i};
    plot(t_exp{i}, error{i})
    xlim([0 5])
    ylim([-20 20])
    xlabel('Time (s)')
    ylabel('Velocity Error (cm/s)')
    title('Signed Velocity Error wrt Time', fignames(i))
    Average(i) = mean(error{i});
    Standard_Dev(i) = std(error{i});
end

%absolute residuals
figure();
for i = 1:6
    subplot(2,3,i);
    ABSerror{i} = abs(error{i});
    plot(t_exp{i}, ABSerror{i})
    xlim([0 5])
    ylim([-2 20])
    xlabel('Time (s)')
    ylabel('Velocity Error (cm/s)')
    title('Absolute Velocity Error wrt Time', fignames(i))
end

%compare signed vs absolute for 5.5V
figure();
plot(t_exp{1}, error{1})
hold on
plot(t_exp{1}, ABSerror{1})
hold off
legend('Signed Error', 'Absolute Error')
title('Signed and Absolute Error wrt Time', fignames(1))
xlabel('Time (s)')
ylabel('Velocity Error (cm/s)')

%all signed
figure()
hold on
for i = 1:6
    plot(t_exp{i}, error{i})
end
title('Signed Velocity Error wrt Time')
xlabel('Time (s)')
ylabel('Velocity Error (cm/s)')
legend(fignames);
xlim([0 5])
hold off

%all wrt theta
figure()
hold on
for i = 1:6
    plot(theta_exp{i}, error{i})
end
title('Signed Velocity Error wrt Theta')
xlabel('Theta (deg)')
ylabel('Velocity Error (cm/s)')
legend(fignames);
xlim([152.5 4472])
hold off

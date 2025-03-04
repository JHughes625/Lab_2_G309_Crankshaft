% ASEN2803 Group 3-09
% 

clear all;
close all;
clc;
theta_input = 0:2160; % Angle Input 6 revolutions
for i = 1:6
  w_input(i) = mean(dataStruct(i).data.Var4);; % Angular Velocity Input
end
%matrix_5V = readmatrix("Project_2\Test1_5pt5V");

%plot(matrix_5V(1,:),matrix_5V(5,:));

r_Theo = 7.5; l_Theo = 26; d_Theo = 15; uncertainty_Theo = 0.05; %[cm]
for i = 1:6
  v_mod(i) = LCSMODEL(r_Theo,d_Theo,l_Theo,theta_input,w_input(i));
end
plot(theta_input,v_mod(i))

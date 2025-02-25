% ASEN2803 Group 3-09
% 

clear all;
close all;
clc;
theta_input = 0:2160; % Angle Input 6 revolutions
w_input = 1; % Angular Velocity Input

%matrix_5V = readmatrix("Project_2\Test1_5pt5V");

%plot(matrix_5V(1,:),matrix_5V(5,:));

r_Theo = 7.5; l_Theo = 26; d_Theo = 15; uncertainty_Theo = 0.05; %[cm]

v_mod = LCSMODEL(r_Theo,d_Theo,l_Theo,theta_input,w_input);

plot(theta_input,v_mod)

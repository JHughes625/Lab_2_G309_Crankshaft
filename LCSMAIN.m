% ASEN2803 Group 3-09
% 

clear all;
close all;
clc;
%theta_input = 0:2160; % Angle Input 6 revolutions
filenames = ["Test1_5pt5V", "Test1_6pt5V", "Test1_7pt5V", "Test1_8pt5V", "Test1_9pt5V", "Test1_10pt5V"];
dataStruct = readData(filenames);
%matrix_5V = readmatrix("Project_2\Test1_5pt5V");

%plot(matrix_5V(1,:),matrix_5V(5,:));

r_Theo = 7.5; l_Theo = 26; d_Theo = 15; uncertainty_Theo = 0.05; %[cm]
v_mod = cell(1, 6);
for i = 1:6
  v_mod{i} = LCSMODEL(r_Theo,d_Theo,l_Theo,dataStruct(i).data.Var3);
end
plot(dataStruct(1).data.Var2,v_mod{1})
hold on
plot(dataStruct(1).data.Var2, dataStruct(1).data.Var5)
legend('model', 'data')

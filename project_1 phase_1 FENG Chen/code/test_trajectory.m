% Used for HKUST ELEC 5660

close all;
clc;
addpath('./utils','./readonly');
figure(1)
h1 = subplot(3,4,1);
h2 = subplot(3,4,2);
h3 = subplot(3,4,3);
h4 = subplot(3,4,4);
h5 = subplot(3,4,6);
h6 = subplot(3,4,7);
h7 = subplot(3,4,8);
h8 = subplot(3,4,10);
h9 = subplot(3,4,11);
h10 = subplot(3,4,12);
set(gcf, 'Renderer', 'painters');

global T_pre e_p_int phi_c_pre theta_c_pre count P_MSE_list V_MSE_list des cur des_v cur_v
global P_RMS V_RMS
count = -1;
T_pre = 0;
e_p_int = zeros(3,1);
phi_c_pre = 0;
theta_c_pre = 0;
P_MSE_list = [];
V_MSE_list = [];
des = [];
des_v = [];
cur = [];
cur_v = [];

P_RMS = 0;
V_RMS = 0;

% Run Trajectory  three trajectories, test one by one
run_trajectory_readonly(h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, @circle_trajectory);
%run_trajectory_readonly(h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, @hover_trajectory);
%run_trajectory_readonly(h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, @diamond_trajectory);

P_MSE_list(1) = cur(1);
P_MSE_list(end) = des(end);
V_MSE_list(1) = cur_v(1);
V_MSE_list(end) = des_v(end);
P_RMS = sum(P_MSE_list);
V_RMS = sum(V_MSE_list);
P_RMS = sqrt(P_RMS/count);
V_RMS = sqrt(V_RMS/count);
disp("Postion_RMS: "+num2str( P_RMS));
disp("Velocity_RMS: "+num2str(V_RMS));

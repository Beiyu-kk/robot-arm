%% DH参数建模
l1=Link([0 0 0 pi/2]);
l2=Link([0 0 0.4318 0]);
l3=Link([-pi/2 0.1505 0.02032 -pi/2]);
l4=Link([0 0.4318 0 pi/2]);
l5=Link([0 0 0 -pi/2]);
l6=Link([0 0 0 0]);
pm560=SerialLink([l1 l2 l3 l4 l5 l6]);

%% 轨迹规划
% 给定初末齐次变换矩阵
t = 0:0.2:2;
T1 = transl(0.3,0,0.1318);
T2 = transl(0.4521,0.2,0.4318);
Ts = ctraj(T1,T2,length(t));

Q=pm560.ikine6s(Ts);

% 画
close all;
figure(1);
pm560.plot(Q)  
hold on;
figure(2);
% tranimate(Ts)  
pm560.teach();
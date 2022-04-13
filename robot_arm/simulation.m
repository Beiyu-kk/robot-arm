%% 建模
% 导入puma560 模型
mdl_puma560;


%% 展示
% 使用teach函数 展示机器人
p560.teach();


%% 规划轨迹
t = 0:0.2:10;
T1 = transl(0.3,0,0.1318);
T2 = transl(0.4521,0.2,0.4318);
Ts = ctraj(T1,T2,length(t));

Q=p560.ikine6s(Ts);

close all;
figure(1);
p560.plot(Q)  
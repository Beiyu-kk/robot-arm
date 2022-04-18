%% 建模
% 导入puma560 模型
mdl_puma560;

% 构建机械臂 UR5
% 使用DH参数构建 (下方的代码效果等同于 mdl_puma560)
L1=Link([0 0 0 pi/2 0 ],'standard'); 
L2=Link([0 0 0.4318 0 0 ],'standard');
L3=Link([0 0.1501 0.0203 -pi/2 0 ],'standard');
L4=Link([0 0.4318 0 pi/2 0 ],'standard');
L5=Link([0 0 0 -pi/2 0 ],'standard');
L6=Link([0 0 0 0 0 ],'standard');
p560 = SerialLink([L1 L2 L3 L4 L5 L6],'name','puma560');  % 连接连杆，将机械臂命名为puma560
% p560.teach()

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
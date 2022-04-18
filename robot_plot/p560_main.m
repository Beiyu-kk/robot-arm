%% 机械臂建模

% 构建机械臂 puma560
% 从工具箱导入 
mdl_puma560;  % 模型被放置变量p560中

% p560.teach()

%% 机械臂画图

% 笑脸
plot_Smileface(p560);

% 奥运五环
% plotRings(p560);

% 普通的圆
% plotCircle(p560);

% 三角形
% plotTriangle(p560);

% 给定最终位置
% q1 = [-20, 40, -210, 0, -60, 0];
q2 = [60, 200, 0, 0, 0, 0];
p560.plot(q2);


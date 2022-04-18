function [ ] = plotTriangle(robot)
%% 定义三角形
% 时间跨度
t = (0:0.5:15)'; 

% 三角形三个顶点
A = [0.4 0.2  0.4];
B = [0.4 0.4  -0.1];
C = [0.4 0  -0.1];

% 利用一次方程y = kx + b 确定三角形的点
% 画边1
k = ( A(3)-B(3) )/( A(2)-B(2) ); % 斜率
dy = A(2) - B(2);
dz = A(3) - B(3);

edge1 = ( A - t*[0 dz/k k*dy]/t(end) )';
for i = 1:size(edge1,1)
    plot3(edge1(1, :), edge1(2, :), edge1(3, :) );
end
hold on 

% 画边2
k = ( B(3)-B(3) )/( C(2)-B(2) ); % 斜率
dy = C(2) - B(2);

edge2 = ( B + t*[0 dy 0]/t(end) )';
for i = 1:size(edge2,1)
    plot3(edge2(1, :), edge2(2, :), edge2(3, :) );
end
hold on

% 画边3
k = ( C(3)-A(3) )/( C(2)-A(2) ); % 斜率
dy = C(2) - A(2);
dz = C(3) - A(3);

edge3 = ( C - t*[0 dz/k k*dy]/t(end) )';
for i = 1:size(edge3,1)
    plot3(edge3(1, :), edge3(2, :), edge3(3, :) );
end
hold on 

points = [edge1 edge2 edge3];


%%
for i = 1:size(points,2)
    % 确定每一帧的末端点
    pause(0.01);
    bx = points(1,i);
    by = points(2,i);
    bz =points(3,i);
    
    % 使用齐次变换矩阵来表达末端点的位置信息
    targetPos = [bx by bz];  % 末端位置向量
    tform = rpy2tr(0, 90, 0); %欧拉角转姿态齐次矩阵
    TR=transl(targetPos)*tform;   % 位姿齐次变换矩阵
    
    % 画出圆的每一个点
    plot3(bx,by,bz,'o','LineWidth',2);
    hold on
    axis([-1 1.2 -1 1.2 -0.5 1])

    % 求逆解，画出机械臂
    q = robot.ikine6s(TR);
    robot.plot(q);%动画演示
end

end
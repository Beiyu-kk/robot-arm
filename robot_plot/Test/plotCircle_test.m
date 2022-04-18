%% DH参数建模
% l1=Link([0 0 0 pi/2]);
% l2=Link([0 0 0.4318 0]);
% l3=Link([-pi/2 0.1505 0.02032 -pi/2]);
% l4=Link([0 0.4318 0 pi/2]);
% l5=Link([0 0 0 -pi/2]);
% l6=Link([0 0 0 0]);
% pm560=SerialLink([l1 l2 l3 l4 l5 l6]);

mdl_puma560;
pm560 = p560;

% pm560.teach();

%% 定义圆路径
% 时间跨度
t = (0:0.5:30)'; count = length(t);

% 圆心和半径
center = [0.4 0 0.4];radius = 0.3;

% 将圆画出来
theta = t*(2*pi/t(end));
points =(center + radius*[zeros(size(theta)) cos(theta) sin(theta)])';
% plot3(points(1,:),points(2,:),points(3,:),'r')

%% 
% 规划机械臂轨迹画圆

for i = 1:size(points,2)
pause(0.01);
bx = points(1,i);
by = points(2,i);
bz =points(3,i);
% tform = rpy2tr(130,-180,-180); %欧拉角转姿态齐次矩阵
tform = rpy2tr(10, 10, 10); 
targetPos = [bx by bz]; %末端位置向量
TR=transl(targetPos); %位姿齐次矩阵
hold on
grid on
figure(2)
plot3(bx,by,bz,'*','LineWidth',1);
hold on
axis([-1 1.2 -1 1.2 -0.5 1])
q = pm560.ikine6s(TR);
% pause(0.01)
pm560.plot(q);%动画演示
end
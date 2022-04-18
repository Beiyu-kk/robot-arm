function [] = plot_Smileface(robot)
    % 函数说明
    % 传参：robot 为一个Serial-link robot class
    % 返回值：无

    %% 定义圆路径
    
    % 圆心和半径
    r = [];
    r = [r; 0.32];
    r = [r; 0.02];
    r = [r; 0.07];
    r = [r; 0.07];
    r = [r; 0.12];

    cen = [];
    cen = [cen; 0.4 0 0.42];
    cen = [cen; 0.4 0 0.42];
    cen = [cen; 0.4 -0.15 0.52];
    cen = [cen; 0.4 0.15 0.52];
    cen = [cen; 0.4  0 0.29];
    
%     for i =1:size(cen,1)-3
%         circles(robot, cen(i, : ), r(i));
%     end
    %% 画图
    %脸
    circles2(robot, cen(1, : ), r(1), 1, 30, 2*pi);
    
    %鼻子
    circles2(robot, cen(2, : ), r(2), 1, 3, 2*pi);

    %左眼
    circles2(robot, cen(3, : ), r(3), 1, 15, 5/6*pi);

    %右眼
    circles2(robot, cen(4, : ), r(4), 2, 15, pi);

    % 嘴巴
    circles2(robot, cen(5, : ), r(5), 10, 20, 2*pi);

end
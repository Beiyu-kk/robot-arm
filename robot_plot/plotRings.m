function [] = plotRings(robot)
    % 函数说明
    % 传参：robot 为一个Serial-link robot class
    % 返回值：无

    %% 定义圆路径
    
    % 圆心和半径
    radius = 0.1;
    cen = [];
    cen = [cen; 0.4 -0.25 0.5];
    cen = [cen; 0.4 0 0.5];
    cen = [cen; 0.4 0.25 0.5];
    cen = [cen; 0.4 -0.125 0.4];
    cen = [cen; 0.4  0.125 0.4];
    
    for i =1:size(cen,1)
        circles1(robot, cen(i, : ), radius);
    end

%     q=[0, 60, 0, 0, 0, 0];
%     robot.plot(q);

end
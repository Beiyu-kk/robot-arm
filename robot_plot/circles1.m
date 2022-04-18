function [] = circle1(robot,center,radius)
    % 函数说明
    % 传参：robot 为一个Serial-link robot class
    % 返回值：无

    %% 定义圆路径
    % 时间跨度
    t = (0:0.5:15)'; 
    
    % 将圆画出来
    theta = t*(2*pi/t(end));
    points =(center + radius*[zeros(size(theta)) cos(theta) sin(theta)])';
%     plot3(points(1,:),points(2,:),points(3,:),'r')
    
    %% 规划机械臂轨迹画圆 
    
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
        plot3(bx,by,bz,'*','LineWidth',2);
        hold on
        axis([-1 1.2 -1 1.2 -0.5 1])

        % 求逆解，画出机械臂
        q = robot.ikine6s(TR);
        robot.plot(q);%动画演示
    end

end
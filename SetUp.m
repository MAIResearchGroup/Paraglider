function P = SetUp()
%% ���������
    P.ro = 1.225;                         % ��������� �������  
    g  = 9.81;                          % ��������� ���������� �������
    P.Env.Wind.Speed    = 8.0;              % �������� ����������� ������
    P.Env.Wind.Pressure = (P.ro*P.Env.Wind.Speed^2)/2;

%% �������
    P.mass = 1;                         % ����� �����, ��

    P.width = 0.1;                      % ������, �
    P.hight = 0.1;                      % ������, �
    P.depth = 0.1;                      % �����,  �

    P.attack  = 20;                     % ���� �����, ����

% ���������
    P.ThrustVector = [1; 0; 0];         % ������ ����������� ����
    P.Thrust  = 4.45;                   % ���� ���������

% ��� � ������������ �����
    P.FoilName = @ClarkYH;
    [P.Wing.Cy, P.Wing.Cx, ... 
     P.Wing.CmA, P.Wing.Cd] = P.FoilName(P.attack); % �� �������

% �������� �����
    P.Wing.Mass = 0.2;                  % ����� �����, ��

    WingLenght = 1.20;                  % ����� �������,  �
    WingWide   = 0.38;                  % ������ �������, �
    %P.Wing.c  = P.wide;                % ������ ~ ������� ����� �����

    P.Wing.S   = WingLenght * WingWide; % ������� �����, �^2

% ��������� �������
    P.CoordSysName = '��������� ��';
    P.pos   = [0; 5; 0];                % ���������, �
    P.vel   = [0; 0; 0];                % ��������, �
    P.omega = deg2rad([0; 0; 0]);       % ������� ��������
    P.ean   = deg2rad([0; 0; 0]);       % ���� ������(����,������,��������)

    P.Weight = (P.mass + P.Wing.Mass) * g;
    
    P.InitCond = [P.vel(1:2); P.pos(1:2)];
    %% ode45 option struct
    P.Options = odeset( 'RelTol',     1e-6,...
                        'AbsTol',     1e-6,...
                        'Events',     @EventFunction,...
                        'Vectorized', true,...
                        'MaxStep',    0.1);    
          %NOTE: We should not need to set MaxStep, but it seems that the
          %event detection in ode45 misses some events when it takes large
          %time steps, if the system dynamics are simple, as is the case
          %here, especially when there is negligable drag.
end


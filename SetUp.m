function [E,P] = SetUp()
%% ���������
    ro = 1.225;                         % ��������� �������  
    g  = 9.81;                          % ��������� ���������� �������
    E.Wind.Speed    = 5.0;              % �������� ����������� ������
    E.Wind.Pressure = (ro*E.Wind.Speed^2)/2;

%% �������
    P.mass = 1;                         % ����� �����, ��

    P.width = 0.1;                      % ������, �
    P.hight = 0.1;                      % ������, �
    P.depth = 0.1;                      % �����,  �

    P.attack  = 2;                      % ���� �����, ����

% ���������
    P.ThrustVector = [1; 0; 0];         % ������ ����������� ����
    P.Thrust  = 4.45;                   % ���� ���������

% ��� � ������������ �����
    P.FoilName = @model908_b0;
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
    P.pos   = [0; 0; 0];                % ���������, �
    P.vel   = [0; 0; 0];                % ��������, �
    P.omega = deg2rad([0; 0; 0]);       % ������� ��������
    P.ean   = deg2rad([0; 0; 0]);       % ���� ������(����,������,��������)

    P.Weight = (P.mass + P.Wing.Mass) * g;
end


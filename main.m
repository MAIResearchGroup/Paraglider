clc; close all; clear;
%% ��������� ������� ���������
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

%%  �������� ������    
    [E, P] = SetUp();    % P ������ Paraglider
    dynFunc = @(t,X)Model(t,X,P,E);
                        
%%  ��������������
    TimeSpan = 0:60;
    res = ode45(dynFunc, TimeSpan, P.InitCond, P.Options);
    plot(res.y(3,:), res.y(4,:))
    m = max(axis);
    axis([0 m 0 m])
    grid on

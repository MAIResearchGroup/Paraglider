clc; close all; clear;
%% ��������� ������� ���������
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

%%  �������� ������    
    [E, P] = SetUp();    % P ������ Paraglider
    dynFunc = @(t,X)Model(t,X,P,E);
                        
%%  ��������������
    TimeSpan = 0:360;
    res = ode45(dynFunc, TimeSpan, P.InitCond, P.Options);
    
%%  ����� �����������
    figure(1)
    PlotMapXY(res.y(3,:), res.y(4,:))
    figure(2)
    PlotRes(res.x(1,:), res.y(3,:), res.y(4,:), res.y(1,:), res.y(2,:))
    figure(3)
    PlotResAng(res.x(1,:), res.y(5,:), res.y(6,:))
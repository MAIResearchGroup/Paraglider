clc; close all; clear;
%% ��������� ������� ���������
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

%%  �������� ������    
    P = SetUp();    % P ������ Paraglider
    dynFunc = @(t,X)Model(t,X,P);
                        
%%  ��������������
    TimeSpan = 0:60;
    res = ode45(dynFunc, TimeSpan, P.InitCond, P.Options);
    plot(res.y(3,:), res.y(4,:))
    grid on
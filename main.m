clc; close all; clear;
%% ��������� ������� ���������
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

%%  �������� ������    
    P = SetUp();    % P ������ Paraglider
    dynFunc = @(t,X)Model(t,X,P);
                        
%%  ��������������
    TimeSpan = 0:1;
    res = ode45(dynFunc, TimeSpan, P.InitCond);
    plot(res.y(3,:), res.y(4,:))
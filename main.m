clc; close all; clear;
%% Настройка рабочих каталогов
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

%%  Исходные данные    
    [E, P] = SetUp();    % P значит Paraglider
    dynFunc = @(t,X)Model(t,X,P,E);
                        
%%  Интегрирование
    TimeSpan = 0:60;
    res = ode45(dynFunc, TimeSpan, P.InitCond, P.Options);
    plot(res.y(3,:), res.y(4,:))
    m = max(axis);
    axis([0 m 0 m])
    grid on

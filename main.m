clc; close all; clear;
%% Настройка рабочих каталогов
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

%%  Исходные данные    
    P = SetUp();    % P значит Paraglider
    dynFunc = @(t,X)Model(t,X,P);
                        
%%  Интегрирование
    TimeSpan = 0:60;
    res = ode45(dynFunc, TimeSpan, P.InitCond, P.Options);
    plot(res.y(3,:), res.y(4,:))
    grid on
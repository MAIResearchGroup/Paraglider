clc; close all; clear;
%% Настройка рабочих каталогов
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

%%  Исходные данные    
    [E,P] = SetUp();    % P значит Paraglider, 
                        % E - Environment

    LiftForce = E.Wind.Pressure * P.Wing.S * P.Wing.Cy;
    X = E.Wind.Pressure * P.Wing.S * P.Wing.Cx;

% Почему не достаточно аргументов?!
% %%  Интегрирование
%     Time = 0:1;
%     [T,Y] = ode45(@Model, Time, P, E);
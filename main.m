clc; close all; clear;
%% ��������� ������� ���������
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

%%  �������� ������    
    [E,P] = SetUp();    % P ������ Paraglider, 
                        % E - Environment

    LiftForce = E.Wind.Pressure * P.Wing.S * P.Wing.Cy;
    X = E.Wind.Pressure * P.Wing.S * P.Wing.Cx;

% ������ �� ���������� ����������?!
% %%  ��������������
%     Time = 0:1;
%     [T,Y] = ode45(@Model, Time, P, E);
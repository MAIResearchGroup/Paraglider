clc; close all;
%% ������� ��������
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);
%%  ��������������
%   �������� ������
    r      = [0;   0];      % ���������, �
    v      = [2;   0];      % ��������, �/c
    attack = deg2rad(2);    % ���� �����, ���
%   ���������
    ITime = 600;              % ����� ��������������, �
    IStep = 0.1;            % ��� ��������������
    [T,Y] = ode45(@Model2, 0:IStep:ITime, [r; v; attack]);
%% ����� ������
    figure(1)
        subplot(2,2,1);
            plot(T, Y(:, 1));
            grid on
            title('��������� ��������� �������� �� ��� � �� �������');
            xlabel('�����, �');
            ylabel('X, �');
        subplot(2,2,2);
            plot(T, Y(:, 2));
            grid on
            title('��������� ��������� �������� �� ��� Y �� �������');
            xlabel('�����, �');
            ylabel('Y, �');
        subplot(2,2,3);
            plot(T, Y(:, 3));
            grid on
            title('��������� �������� �������� �� ��� � �� �������');
            xlabel('�����, �');
            ylabel('V_x, �/�');
        subplot(2,2,4);
            plot(T, Y(:, 4));
            grid on
            title('��������� �������� �������� �� ��� Y �� �������');
            xlabel('�����, �');
            ylabel('V_y, �/�');
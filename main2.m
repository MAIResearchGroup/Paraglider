clc; close all;
%% Рабочие каталоги
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);
%%  Интегрирование
%   Исходные данные
    r      = [0;   0];      % Положение, м
    v      = [2;   0];      % Скорость, м/c
    attack = deg2rad(2);    % Угол атаки, рад
%   Параметры
    ITime = 600;              % Время интегрирования, с
    IStep = 0.1;            % Шаг интегрирования
    [T,Y] = ode45(@Model2, 0:IStep:ITime, [r; v; attack]);
%% Вывод данных
    figure(1)
        subplot(2,2,1);
            plot(T, Y(:, 1));
            grid on
            title('Изменение положения аппарата по оси Х от времени');
            xlabel('Время, с');
            ylabel('X, м');
        subplot(2,2,2);
            plot(T, Y(:, 2));
            grid on
            title('Изменение положения аппарата по оси Y от времени');
            xlabel('Время, с');
            ylabel('Y, м');
        subplot(2,2,3);
            plot(T, Y(:, 3));
            grid on
            title('Изменение скорости аппарата по оси Х от времени');
            xlabel('Время, с');
            ylabel('V_x, м/с');
        subplot(2,2,4);
            plot(T, Y(:, 4));
            grid on
            title('Изменение скорости аппарата по оси Y от времени');
            xlabel('Время, с');
            ylabel('V_y, м/с');
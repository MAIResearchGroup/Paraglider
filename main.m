clc; close all;
%% Рабочие каталоги
%  Профили крыла
PROFILES = '\Profiles';
PFolder = strcat(pwd, PROFILES);
addpath(PFolder);
%  Интерполяция
INTERPOLATION = '\Interpolation\Matlab2014b';
PFolder =  strcat(cd(cd('..\')), INTERPOLATION);
addpath(PFolder);

%%  Интегрирования
%   Исходные данные
    r     = [0;   0; 100];      % Положение, м
    v     = [0;   0; 0];        % Скорость, м
    omega = deg2rad([0; 0; 0]); % Угловая скорость

%   Углы Эйлера
    ean   = deg2rad([0;...      % Угол крена
                     0;...      % Угол тангажа
                     0]);       % Угол рыскания

%TET   = deg2rad(0); % Угол

%   Интегрирование
    ITime = 6; % Время интегрирования, с
    IStep = 0.1; % Шаг интегрирования
    [T,Y] = ode45(@Model, 0:IStep:ITime, [r; v; omega; ean]);

%% Вывод данных
%  График показателей
    figure                % new figure
%     ax1 = subplot(2,2,1); % top subplot
    ax2 = subplot(3,1,1); % bottom subplot
    ax3 = subplot(3,1,2); % bottom subplot
    ax4 = subplot(3,1,3); % bottom subplot
    
    
%     plot(ax1, T, Y(:, 1), T, Y(:, 2), T, Y(:, 3))
%     title(ax1,'Изменение положения')
%     ylabel(ax1,'м')
%     grid on
    
    plot(ax2, T, Y(:, 4), T, Y(:, 5), T, Y(:, 6))
    grid on
    title(ax2,'Изменение скорости')
    ylabel(ax2,'м/с')

    plot(ax3, T, Y(:, 7), T, Y(:, 8), T, Y(:, 9))
    grid on
    title(ax3,'Изменение угловой скорости')
    ylabel(ax3,'Угловая скорость (град/с)')

    plot(ax4, T, Y(:, 10), T, Y(:, 11), T, Y(:, 12))
    grid on
    title(ax4,'Изменение углов')
    ylabel(ax4,'Угол (град)')
    
%  График движения аппарата    
    figure(2)
    plot3(Y(:, 1),  Y(:, 2), Y(:, 3))
    grid on
    xlabel('X')
    ylabel('У')
    zlabel('Z')

    figure(3)
    plot(Y(:, 1),  Y(:, 3))
    xlabel('X')
    ylabel('Z')
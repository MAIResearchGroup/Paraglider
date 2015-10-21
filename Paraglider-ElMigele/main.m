clc; close all;

% Рабочие каталоги
PROFILES = '\Profiles';

PFolder = strcat(pwd, PROFILES)

addpath(PFolder)
%
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
[T,Y] = ode45(@Model, 0:0.01:10, [r; v; omega; ean]);

%% Вывод данных
figure                % new figure
ax1 = subplot(3,1,1); % top subplot
ax2 = subplot(3,1,2); % bottom subplot
ax3 = subplot(3,1,3); % bottom subplot

plot(ax1, T, Y(:, 4), T, Y(:, 5), T, Y(:, 6))
grid on
title(ax1,'Изменение скорости')
ylabel(ax1,'м/с')

plot(ax2, T, Y(:, 7), T, Y(:, 8), T, Y(:, 9))
title(ax2,'Изменение угловой скорости')
ylabel(ax2,'Угловая скорость (град/с)')

plot(ax3, T, Y(:, 10), T, Y(:, 11), T, Y(:, 12))
title(ax3,'Изменение углов')
ylabel(ax3,'Угол (град)')

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
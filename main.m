clc; close all;

% Рабочие каталоги
PROFILES = '\Profiles';

PFolder = strcat(pwd, PROFILES)

addpath(PFolder)
%

r     = [0; 100; 0];
v     = [0;   0; 0];
omega = deg2rad([0; 0; 0]);
phi   = deg2rad([0; 0; 0]);


[T,Y] = ode45(@Model, 0:0.1:10, [r; v; omega; phi]);

figure % new figure
ax1 = subplot(3,1,1); % top subplot
ax2 = subplot(3,1,2); % bottom subplot
ax3 = subplot(3,1,3); % bottom subplot

plot(ax1, T, Y(:, 4), T, Y(:, 5), T, Y(:, 6))
grid on
title(ax1,'Изменение скорости')
ylabel(ax1,'м/с')

plot(ax2, T, Y(:, 7), T, Y(:, 8), T, Y(:, 9))
title(ax2,'Изменение угла наклона плоскости к горизонту')
ylabel(ax2,'Угол (град)')

plot(ax3, T, Y(:, 10), T, Y(:, 11), T, Y(:, 12))
title(ax3,'Изменение высоты')
ylabel(ax3,'Высота (м)')

figure(2)
plot3(Y(:, 4), Y(:, 5), Y(:, 6))

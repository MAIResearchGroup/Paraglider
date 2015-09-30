clc;
clear all;

y = zeros(3,1);
y(1) = 5;
y(2) = deg2rad(5);
y(3) = 5;

[T,Y] = ode45(@Model, [0:0.1:10], y);

figure % new figure
ax1 = subplot(3,1,1); % top subplot
ax2 = subplot(3,1,2); % bottom subplot
ax3 = subplot(3,1,3); % bottom subplot

plot(ax1, T, Y(:,1))
grid on
title(ax1,'Изменение скорости')
ylabel(ax1,'м/с')

plot(ax2, T, rad2deg(Y(:,2)))
title(ax2,'Изменение угла наклона плоскости к горизонту')
ylabel(ax2,'Угол (град)')

plot(ax3, T, Y(:,3))
title(ax3,'Изменение всоты‹')
ylabel(ax3,'Высота (м)')
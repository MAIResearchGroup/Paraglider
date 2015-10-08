clc; close all;
r     = [0; 100; 0];
v     = [0;   0; 0];
omega = deg2rad([0; 0; 0]);
phi   = deg2rad([0; 0; 0]);


[T,Y] = ode45(@Model, [0:0.1:10], [r; v; omega; phi]);

figure % new figure
ax1 = subplot(3,1,1); % top subplot
ax2 = subplot(3,1,2); % bottom subplot
ax3 = subplot(3,1,3); % bottom subplot

plot(ax1, T, Y(:,1))
grid on
title(ax1,'��������� ��������')
ylabel(ax1,'�/�')

plot(ax2, T, rad2deg(Y(:,2)))
title(ax2,'��������� ���� ������� ��������� � ���������')
ylabel(ax2,'���� (����)')

plot(ax3, T, Y(:,3))
title(ax3,'��������� ������')
ylabel(ax3,'������ (�)')
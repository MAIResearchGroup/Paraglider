clc; clear all;

y = zeros(3,1);
y(1) = 5;
y(2) = deg2rad(5);
y(3) = 100;

[T,Y] = ode45(@Velocity, [0:0.1:60], y);
figure(1)
plot(T, Y(:,1));
figure(2);
plot(T, rad2deg(Y(:,2)));
figure(3);
plot(T, Y(:,3))
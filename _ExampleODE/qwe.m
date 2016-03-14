clc; clear all;
format long g
global tetta a e Omega u i M r p t T d S_m omega_E fi luambda luambda_B E
%1 спутник
M = 0.398603e+6;
tetta = deg2rad(0);
a = 6371.21 + 23222;
e = 0.01;
Omega = deg2rad(0);
u = deg2rad(0);
i = deg2rad(56);

T = 2*pi*a^(3/2)/sqrt(M);
p = a * (1 - sqrt(e));
r = p / (1 + e * cos(tetta));

dr = sqrt(M / p) * e * cos(tetta)
dtetta = sqrt(M*p)/r.^2
y = zeros(12,1);
y(1) = r * (cos(u) * cos(Omega) - sin(u) * sin(Omega) * cos(i));
y(2) = r * (cos(u) * sin(Omega) + sin(u) * cos(Omega) * cos(i));
y(3) = r * sin(u) * sin(i);

y(4) = dr * y(1) / r - r * dtetta * (sin(u) * cos(Omega) + cos(u) * sin(Omega) * cos(i));
y(5) = dr * y(2) / r - r * dtetta * (sin(u) * sin(Omega) - cos(u) * cos(Omega) * cos(i));
y(6) = dr * y(3) / r - r * dtetta * cos(u) * sin(i);

%[T,Y] = ode45(@qwerty, [0:1:T], y);
%figure (1);
%plot(Y(:,1),Y(:,3));
%plot(Y(:,2),Y(:,3));


%2 спутник
M = 0.398603e+6;
tetta = deg2rad(40);
a = 6371.21 + 23222;
e = 0.01;
Omega = deg2rad(0);
u = deg2rad(0);
i = deg2rad(56);

T = 2*pi*a^(3/2)/sqrt(M);
p = a * (1 - sqrt(e));
r = p / (1 + e * cos(tetta));
c = r*r;
dr = sqrt(M / p) * e * cos(tetta)
dtetta = sqrt(M*p)/r.^2
y(7) = r * (cos(u) * cos(Omega) - sin(u) * sin(Omega) * cos(i));
y(8) = r * (cos(u) * sin(Omega) + sin(u) * cos(Omega) * cos(i));
y(9) = r * sin(u) * sin(i);

y(10) = dr * y(7) / r - r * dtetta * (sin(u) * cos(Omega) + cos(u) * sin(Omega) * cos(i));
y(11) = dr * y(8) / r - r * dtetta * (sin(u) * sin(Omega) - cos(u) * cos(Omega) * cos(i));
y(12) = dr * y(9) / r - r * dtetta * cos(u) * sin(i);
y


[T,Y] = ode45(@qwerty, [0:1:T], y);

figure (1);
plot(Y(:,1),Y(:,3));

figure (2);
plot(Y(:,7),Y(:,9));
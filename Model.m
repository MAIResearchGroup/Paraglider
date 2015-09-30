function dy = Model(t, y)
%%CONST
mass = 0.5;         % kg
alpha = deg2rad(2); % rad
Cx = 0.0162;
S=1.2*0.38;         % m
Cy = 0.266;
P = 0.4;
%

Vw = y(1);

X = Cx * 1.225 * (Vw^2 / 2) *S;
Y = Cy * 1.225 * (Vw^2 / 2) *S;
G = mass*9.81;                  % H

dy = zeros(3, 1);
    dy(1) =  -X/mass - G*sin(y(2))/mass + P*cos(alpha)/mass;
    dy(2) =(P*(sin(alpha)) + Y - G*cos(y(2)))/(mass*y(1));
    dy(3) = y(1)*sin(y(2));
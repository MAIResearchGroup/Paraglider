function dy = qwerty(t,y)
global M
r = zeros(2);
r(1) = sqrt(y(1)^2 + y(2)^2 + y(3)^2);
r(2) = sqrt(y(7)^2 + y(8)^2 + y(9)^2);
dy = zeros(12,1);    % a column vector
dy(1) = y(4);
dy(2) = y(5);
dy(3) = y(6);
dy(4) = -M*y(1)/r(1)^3;
dy(5) = -M*y(2)/r(1)^3;
dy(6) = -M*y(3)/r(1)^3;
dy(7) = y(10);
dy(8) = y(11);
dy(9) = y(12);
dy(10) = -M*y(7)/r(2)^3;
dy(11) = -M*y(8)/r(2)^3;
dy(12) = -M*y(9)/r(2)^3;
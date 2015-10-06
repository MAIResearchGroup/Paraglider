clc; close all;

AngleOfAttackLimit = -20:0.01:24;

i = 1;
for a = AngleOfAttackLimit
    ret = WFInterp(a);
    Cy(i) = ret(1);
    Cx(i) = ret(2);
    CmA(i) = ret(3);
    i = i+1;
end

figure(1)
plot(AngleOfAttackLimit, Cy,...
     AngleOfAttackLimit, Cx,...
     AngleOfAttackLimit, CmA)
grid on

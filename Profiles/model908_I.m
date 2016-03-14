%%������ 908 �������������
function res = model908_I(angle)
    %% ������� ������ (�� ��������)
    palpha = [-12.5;  -10.5;  -8.5;   -6.5;   -4.5;   -2.5;   -0.5;    1.5;    4.5;    5.5;    7.5;    9.5;    11.5;   13.5;   15.5;  17.5;   19.5;    22.5;    24.5;    25.5;    27.5;    29.5;    32.5;    33.5;    35.5];
    pCy    = [-0.07;  -0.05;  -0.03;   0;      0.025;  0.05;   0.075;  0.095;  0.11;   0.13;   0.15;   0.165;  0.18;   0.21;   0.225; 0.25;   0.275;   0.3;     0.33;    0.36;    0.39;    0.42;    0.455;   0.49;    0.525];
    pCx    = [ 0.025;  0.022;  0.02;   0.02;   0.021;  0.022;  0.026;  0.03;   0.035;  0.04;   0.05;   0.06;   0.07;   0.085;  0.1;   0.12;   0.135;   0.155;   0.185;   0.21;    0.235;   0.265;   0.295;   0.335;   0.365];

    res = [LinearInterp(palpha, pCy,  angle);...
           LinearInterp(palpha, pCx,  angle);...
           LinearInterp(palpha, pCmA, angle)];
end
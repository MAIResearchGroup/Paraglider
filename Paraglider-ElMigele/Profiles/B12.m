function B12()
    clc; close all;
    %% ������� ������
    palpha = [-6;      -4;       -3;      -2;       -1;       0;       1;       2;        4;       6;       8;       10;      12;       14;      16;      18;      20;      22;    24];
    pCy    = [-0.337;  -0.208;   -0.142;  -0.076;   -0.014;   0.053;   0.122;   0.200;    0.360;   0.524;   0.670;   0.796;   0.910;    0.980;   1.006;   1.005;   0.905;   0.840; 0.790];
    pCx    = [0.01904;  0.01376;  0.01170; 0.01016;  0.00858; 0.00828; 0.02878; 0.01088;  0.01800; 0.02740; 0.03908; 0.05340; 0.06880;  0.08380; 0.10900; 0.14680; 0.26300; Inf;   Inf];
    pCmA   = [-0.0708; -0.0390;  -0.0256; -0.0108;   0.000;   0.0138;  0.0298;  0.0482;   0.0880;  0.0124;  0.0159;  0.1856;  0.2096;   0.2218;  0.2360;  0.2440;  0.2680;  Inf;   Inf];
    pCd     = [Inf;      Inf;      Inf;     Inf;      Inf;     0.260;   0.244;   0.241;    0.241;   0.237;   0.237;   0.232;   0.224;    0.226;   0.235;   0.243;   0.296;   Inf;   Inf];
    % �������� � ������
    H = 2000.0;    % ������, � 
    T = 275.2;     % �����������, � 


    AngleOfAttackLimit = -6:0.01:24; % ������� �� ���� �����

    %% ������ ������������
    i = 1;
    for a = AngleOfAttackLimit
        ret = WFInterp(palpha, pCy, pCx, pCmA, pCd, a, H, T);
        Cy(i)  = ret(1);
        Cx(i)  = ret(2);
        CmA(i) = ret(3);
        Cd(i)  = ret(4);
        T(i)   = ret(5);
        i = i+1;
    end
    %% �������
    figure(1)
    plot(AngleOfAttackLimit, Cy,...
         AngleOfAttackLimit, Cx,...
         AngleOfAttackLimit, CmA,...
         AngleOfAttackLimit, Cd)
    grid on
    title('������� ����������� ������������');
    legend('Cy','Cx','CmA','Cd');
end

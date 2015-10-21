function B12()
    clc; close all;
    %% Массивы данных
    palpha = [-2;     0;      2;      4;      6;      8;      10;      12;     14;     16;     18;     20    ];
    pCy    = [0.006;  0.133;  0.294;  0.458;  0.601;  0.740;  0.872;   0.990;  1.072;  1.100;  1.016;  0.940 ];
    pCx    = [0.0096; 0.0076; 0.0120; 0.0194; 0.0288; 0.0403; 0.0560;  0.0740; 0.0852; 0.1426; 0.2400; Inf   ];
    pCmA   = [0.026;  0.054;  0.090;  0.126;  0.151;  0.190;  0.220;   0.248;  0.276;  0.300;  Inf;    Inf   ];
    pCd    = [Inf;    0.391;  0.306;  0.275;  0.261;  0.257;  0.252;   0.251;  0.253;  0.273;  Inf;    Inf   ];
    % Задается в ручную
    H = 2000.0;    % высота, м 
    T = 275.2;     % температура, К 


    AngleOfAttackLimit = -6:0.01:24; % пределы на угол атаки

    %% Запуск интерполяции
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
    %% Графики
    figure(1)
    plot(AngleOfAttackLimit, Cy,...
         AngleOfAttackLimit, Cx,...
         AngleOfAttackLimit, CmA,...
         AngleOfAttackLimit, Cd)
    grid on
    title('Графики атмосферных коэфициентов');
    legend('Cy','Cx','CmA','Cd');
end

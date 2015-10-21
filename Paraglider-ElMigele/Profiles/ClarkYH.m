function res = ClarkYH(angle)
    clc; close all;
    %% Массивы данных
    palpha = [-20;    -16;    -12;    -8;     -4;     -2;      0;      2;      4;      8;      10;     12;     16;     18;     20;    22;     24];
    pCy    = [-0.576; -0.596; -0.562; -0.388; -0.13;   0;      0.13;   0.266;  0.4;    0.656;  0.792;  0.924;  1.166;  1.258;  1.28;  1.24;   1.148];
    pCx    = [0.257;   0.2028; 0.0948; 0.0254; 0.0126; 0.0116; 0.0126; 0.0162; 0.0226; 0.0428; 0.0592; 0.0768; 0.1176; 0.1462; 0.18;  0.2386; 0.2892];
    pCmA   = [-0.226; -0.212; -0.148; -0.076; -0.006;  0.028;  0.064;  0.098;  0.132;  0.202;  0.238;  0.272;  0.334;  0.36;   0.38;  0.392;  0.394];
    pCd    = [0.392;   0.356;  0.264;  0.196;  Inf;    Inf;    0.493;  0.368;  0.330;  0.308;  0.300;  0.294;  0.286;  0.286;  0.297; 0.316;  0.344];
    
    %% Данные с датчиков
    % Задается в ручную
    H = 2000.0;    % высота, м 
    T = 275.2;     % температура, К 

    function test()
    AngleOfAttackLimit = -20:0.01:24; % пределы на угол атаки

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
         AngleOfAttackLimit, Cd);
    grid on
    title('Графики атмосферных коэфициентов');
    legend('Cy','Cx','CmA','Cd');
    end
    %test()
    
    ret = WFInterp(palpha, pCy, pCx, pCmA, pCd, angle, H, T);
    Cy  = ret(1);
    Cx  = ret(2);
    CmA = ret(3);
    
    res = [Cy, Cx, CmA];
end

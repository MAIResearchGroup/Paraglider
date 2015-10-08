function ClarkYH()
clc; close all;

    function res = WFInterp(angle, height, temp)
        palpha = [-20;    -16;    -12;    -8;     -4;     -2;     0;      2;      4;      8;      10;     12;     16;     18;     20;   22;     24];
        pCy    = [-0.576; -0.596; -0.562; -0.388; -0.13;  0;      0.13;   0.266;  0.4;    0.656;  0.792;  0.924;  1.166;  1.258;  1.28; 1.24;   1.148];
        pCx    = [0.257;  0.2028; 0.0948; 0.0254; 0.0126; 0.0116; 0.0126; 0.0162; 0.0226; 0.0428; 0.0592; 0.0768; 0.1176; 0.1462; 0.18; 0.2386; 0.2892];
        pCmA   = [-0.226; -0.212; -0.148; -0.076; -0.006; 0.028;  0.064;  0.098;  0.132;  0.202;  0.238;  0.272;  0.334;  0.36;   0.38; 0.392;  0.394];

        Height= [0;     500;   1000;  1500;  2000;  2500;  3000;  4000;  5000;  6000;  7000;  8000;  9000;  10000; 11000; 12000; 14000; 16000; 18000; 20000; 24000; 28000; 32000; 36000];
        Tempre= [288.2; 284.9; 281.7; 278.4; 275.2; 271.9; 268.7; 262.2; 255.7; 249.2; 242.7; 236.2; 229.7; 223.3; 216.7; 216.7; 216.7; 216.7; 216.7; 216.7; 220.6; 224.5; 228.5; 239.3];


        Cy_  = interp1(palpha, pCy, angle);
        Cx_  = interp1(palpha, pCx, angle);
        CmA_ = interp1(palpha, pCmA, angle);

        pT = interp1(Height, Tempre, height);

        res = [Cy_; Cx_; CmA_; pT];

    end

AngleOfAttackLimit = -20:0.01:24;

i = 1;
for a = AngleOfAttackLimit
    ret = WFInterp(a, 20000, 0);
    Cy(i)  = ret(1);
    Cx(i)  = ret(2);
    CmA(i) = ret(3);
    T(i)   = ret(4);
    i = i+1;
end

figure(1)
plot(AngleOfAttackLimit, Cy,...
     AngleOfAttackLimit, Cx,...
     AngleOfAttackLimit, CmA)
grid on
end

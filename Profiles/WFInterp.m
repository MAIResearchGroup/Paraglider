function res = WFInterp(pa, pcy, pcx, pcm, pcd, angle, height, temp)
    palpha = pa;
    pCy    = pcy;
    pCx    = pcx;
    pCmA   = pcm;
    pCd    = pcd;

    Height= [0;     500;   1000;  1500;  2000;  2500;  3000;  4000;  5000;  6000;  7000;  8000;  9000;  10000; 11000; 12000; 14000; 16000; 18000; 20000; 24000; 28000; 32000; 36000];
    Tempre= [288.2; 284.9; 281.7; 278.4; 275.2; 271.9; 268.7; 262.2; 255.7; 249.2; 242.7; 236.2; 229.7; 223.3; 216.7; 216.7; 216.7; 216.7; 216.7; 216.7; 220.6; 224.5; 228.5; 239.3];


    Cy_  = interp1(palpha, pCy,  angle);
    Cx_  = interp1(palpha, pCx,  angle);
    CmA_ = interp1(palpha, pCmA, angle);
    Cd_  = interp1(palpha, pCd,  angle);
    
    pT   = interp1(Height, Tempre, height);

    res = [Cy_; Cx_; CmA_; Cd_; pT];

end

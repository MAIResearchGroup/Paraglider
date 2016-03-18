function [rCy, rCx, rCmA, rCd] = TSAGI731()
    alpha = [-2;     0;      2;      4;      6;      8;      10;      12;     14;     16;     18;     20    ];
    Cy    = [0.006;  0.133;  0.294;  0.458;  0.601;  0.740;  0.872;   0.990;  1.072;  1.100;  1.016;  0.940 ];
    Cx    = [0.0096; 0.0076; 0.0120; 0.0194; 0.0288; 0.0403; 0.0560;  0.0740; 0.0852; 0.1426; 0.2400; Inf   ];
    CmA   = [0.026;  0.054;  0.090;  0.126;  0.151;  0.190;  0.220;   0.248;  0.276;  0.300;  Inf;    Inf   ];
    Cd    = [Inf;    0.391;  0.306;  0.275;  0.261;  0.257;  0.252;   0.251;  0.253;  0.273;  Inf;    Inf   ];
    
    rCy  = LinearInterp(alpha, Cy,  angle); % ����. ���������  ����
    rCx  = LinearInterp(alpha, Cx,  angle); % ����. ���������� ����
    rCmA = LinearInterp(alpha, CmA, angle); % ����. ������� �������� ������, ���� ��
                                            % ���� ����� �� �����
    rCd  = LinearInterp(alpha, Cd,  angle); % ����. ������ �������� 
end

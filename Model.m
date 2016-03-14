function dy = Model(t, x)
    %% ��������� ���������
%        r     = x(1:3);     % ���������
        v     = x(4:6);     % ��������
        omega = x(7:9);     % ������� ��������
        ean   = x(10:12);   % ���� ������
        %TET   = x(13);
    
    %% ��������� ������� ����� (������������)
        ro = 1.225; % ��������� �������        
        g  = 9.81;  % ��������� ���������� �������
        Vw = 5.0;   % �������� ����������� ������
    
    %% �������� ����� (���)
        width = 0.1;          % ������, �
        hight = 0.1;          % ������, �
        depth = 0.1;          % �����,  �

        mass1 = 2.0;           % ����� �����, ��
    
    %% ��������� ��������
        vP = [1; 0; 0];        % ������ ����������� ����
        P  = 4.45;             % ���� ���������
    
    %% �������� �����
        mass2 = 0.2;           % ����� �����, ��

        lenght = 1.20;         % ����� �������,  �
        wide   = 0.38;         % ������ �������, �
        c      = wide;         % ��� ������� ����� �������� � ������� �����
                               % �����
                               
        S      = lenght*wide;  % ������� �����, �^2

        angle  = deg2rad(2);    % ���� �����, ���
    
    %% ������� ���������
    %  R^u_b
        Rub = [ cos(ean(2))*cos(ean(3)), sin(ean(1))*sin(ean(2))*cos(ean(3)) - cos(ean(1))*sin(ean(3)), cos(ean(1))*sin(ean(2))*cos(ean(3)) + sin(ean(1))*sin(ean(3));...
                cos(ean(2))*sin(ean(3)), sin(ean(1))*sin(ean(2))*sin(ean(3)) + cos(ean(1))*cos(ean(3)), cos(ean(1))*sin(ean(2))*sin(ean(3)) - sin(ean(1))*cos(ean(3));...
               -sin(ean(2)),             sin(ean(1))*cos(ean(2)),              cos(ean(1))*cos(ean(2))];
    %  R_ea
        Rea = [1, sin(ean(1))*tan(ean(2)),  cos(ean(1))*tan(ean(2));...
               0, cos(ean(1)),             -sin(ean(1));...
               0, sin(ean(1))/cos(ean(2)),  cos(ean(1))/cos(ean(2))];

    %% ���� ���� � ������
        FPPoint = [-0.05; 0; 0];    % ��������� ����� ���������� ���� ����
        FP = P*vP;                  % ���� ����
        MP = cross(FPPoint, FP);    % ������ ����
    
    %% �������������� ���� � ������
        MGPoint = [0; 0; 0];             % ����� ����
        TM = mass1 + mass2;              % ����� �����
        FG = Rub\[0; 0; 1]*g*(TM);  % ���� �������
        MG = cross(MGPoint, FG);         % ������ ���� �������
    
    %% ���������� �������� ��� ����
        Jxx = (1/12)*mass1*(width^2  + depth^2);
        Jyy = (1/12)*mass1*(hight^2 + depth^2);
        Jzz = (1/12)*mass1*(hight^2 + width^2);
        J = [Jxx 0  0;
              0 Jyy 0;
              0  0 Jzz];

    %% ������������
    %  ������ ������ ������� � ��������� �� �������������
        profile = ClarkYH(angle);
        Cy = profile(1);        % ����. ���������  ����
        Cx = profile(2);        % ����. ���������� ���� 
%         Cm = profile(3);        % ����. ������� �������� ������, ���� ��
%                                 % ���� ����� �� �����
        Cd = profile(4);        % ����. ������ ��������
        
%        MAPoint = [0.1; 2; 0];  % ����� ���������� ���  

%         X       = [-1; 0; 0] * Cx * ro * (Vw^2 / 2) *S; % ���������� ����
%         Y       = [0;  1; 0] * Cy * ro * (Vw^2 / 2) *S; % ���������  ����
    
    % ����� �� ����
        FA      = ro*S*(Vw^2/2)*[-Cx*cos(angle)+Cy*sin(angle);...
                                  0;...
                                 -Cx*sin(angle)-Cy*cos(angle)];
%     MX = cross(MAPoint, X);
%     MY = cross(MAPoint, Y);  
    %  ������ �� ���
        MA = ro*S*(Vw^2/2)*[ 0;...
                             c*(Cd);...
                             0];

    %% ����� ��� � ��������
        F = FG + FP + FA;
        M = MG + MP + MA;
%        V = ((v(1)^2+v(2)^2)^2+v(3)^2); 
       
    %%  ��������������
        dr_dt     = Rub*v;
        dv_dt     = cross(omega, v) + (F/TM);
        dean_dt   = Rea*ean;
        domega_dt = J\M - J\cross(omega, J*omega);
    
%         dTET_dt   = (P*(sin(angle))+ Y(2) -FG(2)*cos(TET))/((mass1+mass2)*V);

%         dH_dt = dv_dt;

        dy = [dr_dt; dv_dt; domega_dt; dean_dt];
end
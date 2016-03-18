% ����������� ���������
% ����� ��� �����. ��������� XY
% ���� ������ 16.03.2016
function dy = Model2(t, x)
%        pos = x(1, 2);
        vel = x(3:4);
        ata = x(5);            % attack angle
    %% ��������� ������� ����� (������������)
        ro = 1.225;            % ��������� �������        
        g  = 9.81;             % ��������� ���������� �������
        Vw = vel(1);           % �������� ����������� ������, �� ���� ���
                               % ����� �������� �������� ��        
    %% �������� �����
        mass   = 0.2;          % ����� �����, ��
        lenght = 1.00;         % ����� �������,  �
        wide   = 3.00;         % ������ �������, �
        c      = 0.0008;         % ��� ������� ����� �������� � ������� �����
                               % �����                               
        S      = lenght*wide;  % ������� �����, �^2
%         angle  = deg2rad(2);   % ���� �����, ���
    %% ������ ������ � �� ������������� �������
        profile = ClarkYH(ata);
    %% ����, ����������� �� �����
    %  ��������� ����, �
        FU = (ro*Vw^2)/2*S*profile(1); 
    %  ���������� ����, �
        FR = (ro*Vw^2)/2*S*profile(2);
    %  ���� �������, �
        FM = mass*g;
    %  ���� �����. ��������� ��� ������������ �������� �� ��� �
        P  = 1.001*FR;
%   %% ������������� ��� �� ���. ��������������� �������� � 2-� ����
%         FT = [P - FR; FU - FM];
    %% �������� ������
%         M = (ro*Vw^2)/2*S*c*profile(4); % ���� ������ ������ � ����������
%         �����, �� �������� ����������� ��-�� �������� ������� ����� �����
%         ������ �������� � ������ ������ ���� �� �����, ���� ��� ����
%         ��������� � ������ ����
    %% ��������� �������� �����
        dy = [vel(1);...
              vel(2);...
              P - FR;...
              FU - FM;
              0];
end
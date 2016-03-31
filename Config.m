% ������ ���� �������� ��������� ������� �������������, ���������� �����
% �������������. ��������, ������������ ��� �������� ������ � �����-���� 
% ����� ����� �������� � ������������ ������ ������.
function [ ModelConf ] = Config()
    Paraglider.mass          = 2;         % ����� ��������� �����, ��
    Paraglider.Payload = [0.1; 0.1; 0.1]; % �������� ��������� �����, �

    Paraglider.Thrust        = 11;        % ���� ���������, H
    Paraglider.Wing.FoilName = @ClarkYH;  % ������� �� ����� Profiles
    
    Paraglider.StartAltitude = 0;         % ������ ��� ������� �����, �
    
    
    ModelConf = [Paraglider];
end


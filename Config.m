% ������ ���� �������� ��������� ������� �������������, ���������� �����
% �������������. ��������, ������������ ��� �������� ������ � �����-���� 
% ����� ����� �������� � ������������ ������ ������.
function [ ModelConf ] = Config()
    Paraglider.mass          = 7;         % ����� ��������� �����, ��

    Paraglider.Thrust        = 50;        % ���� ���������, H
    Paraglider.Wing.FoilName = @ClarkYH;  % ������� �� ����� Profiles
    
    Paraglider.StartAltitude = 0;         % ������ ��� ������� �����, �
    
    
    ModelConf = [Paraglider];
end


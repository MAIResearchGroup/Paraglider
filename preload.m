%% ��������� ������� ���������
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

PATH = strcat(pwd, '\.data');
addpath( PATH )
    % ��������� ��� ������ � Workspace, ��������, ����������� ���������.
rmpath( PATH )

if useCBSAF
    cbsaf;
end

if verify
    verification(visualize);
end
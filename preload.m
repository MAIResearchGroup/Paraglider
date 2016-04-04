%% Настройка рабочих каталогов
PROFILES = strcat(pwd, '\Profiles');
INCLUDES = strcat(pwd, '\Includes');
addpath(PROFILES, INCLUDES);

PATH = strcat(pwd, '\.data');
addpath( PATH )
    % Загружаем все данные в Workspace, например, стандартную атмосферу.
rmpath( PATH )

if useCBSAF
    cbsaf;
end

if verify
    verification(visualize);
end
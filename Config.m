% Данный файл содержит начальные условия моделирования, задаваемые самим
% пользователем. Удаление, незаполнение или неверные данные в каких-либо 
% полях может привести к неправильной работе модели.
function [ ModelConf ] = Config()
    Paraglider.mass          = 7;         % Масса полезного груза, кг

    Paraglider.Thrust        = 50;        % тяга двигателя, H
    Paraglider.Wing.FoilName = @ClarkYH;  % профиль из папки Profiles
    
    Paraglider.StartAltitude = 0;         % высота над уровнем Земли, м
    
    
    ModelConf = [Paraglider];
end


% Данный файл содержит начальные условия моделирования, задаваемые самим
% пользователем. Удаление, незаполнение или неверные данные в каких-либо 
% полях может привести к неправильной работе модели.
function [ ModelConf ] = Config()
    Paraglider.mass          = 2;         % Масса полезного груза, кг
    Paraglider.Payload = [0.1; 0.1; 0.1]; % Габариты полезного груза, м

    Paraglider.Thrust        = 11;        % тяга двигателя, H
    Paraglider.Wing.FoilName = @ClarkYH;  % профиль из папки Profiles
    
    Paraglider.StartAltitude = 0;         % высота над уровнем Земли, м
    
    
    ModelConf = [Paraglider];
end


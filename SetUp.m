function [E,P] = SetUp()
%% Окружение
    ro = 1.225;                         % Плотность воздуха  
    g  = 9.81;                          % Ускорение свободного падения
    E.Wind.Speed    = 5.0;              % Скорость набегающего потока
    E.Wind.Pressure = (ro*E.Wind.Speed^2)/2;

%% Аппарат
    P.mass = 1;                         % масса груза, кг

    P.width = 0.1;                      % Ширина, м
    P.hight = 0.1;                      % Высота, м
    P.depth = 0.1;                      % Длина,  м

    P.attack  = 2;                      % Угол атаки, град

% Двигатель
    P.ThrustVector = [1; 0; 0];         % вектор направления тяги
    P.Thrust  = 4.45;                   % тяга двигателя

% Тип и аэродинамика крыла
    P.FoilName = @model908_b0;
    [P.Wing.Cy, P.Wing.Cx, ... 
     P.Wing.CmA, P.Wing.Cd] = P.FoilName(P.attack); % АД профиля

% Габариты крыла
    P.Wing.Mass = 0.2;                  % масса крыла, кг

    WingLenght = 1.20;                  % длина профиля,  м
    WingWide   = 0.38;                  % ширина профиля, м
    %P.Wing.c  = P.wide;                % ширина ~ среднюю хорду крыла

    P.Wing.S   = WingLenght * WingWide; % площадь крыла, м^2

% Начальные условия
    P.CoordSysName = 'Стартовая СК';
    P.pos   = [0; 0; 0];                % Положение, м
    P.vel   = [0; 0; 0];                % Скорость, м
    P.omega = deg2rad([0; 0; 0]);       % Угловая скорость
    P.ean   = deg2rad([0; 0; 0]);       % Углы Эйлера(крен,тангаж,рысканье)

    P.Weight = (P.mass + P.Wing.Mass) * g;
end


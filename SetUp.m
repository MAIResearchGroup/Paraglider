function P = SetUp()
%% Окружение
    P.ro = 1.225;                         % Плотность воздуха  
    g  = 9.81;                          % Ускорение свободного падения
    P.Env.Wind.Speed    = 8.0;              % Скорость набегающего потока
    P.Env.Wind.Pressure = (P.ro*P.Env.Wind.Speed^2)/2;

%% Аппарат
    P.mass = 1;                         % масса груза, кг

    P.width = 0.1;                      % Ширина, м
    P.hight = 0.1;                      % Высота, м
    P.depth = 0.1;                      % Длина,  м

    P.attack  = 20;                     % Угол атаки, град

% Двигатель
    P.ThrustVector = [1; 0; 0];         % вектор направления тяги
    P.Thrust  = 4.45;                   % тяга двигателя

% Тип и аэродинамика крыла
    P.FoilName = @ClarkYH;
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
    P.pos   = [0; 5; 0];                % Положение, м
    P.vel   = [0; 0; 0];                % Скорость, м
    P.omega = deg2rad([0; 0; 0]);       % Угловая скорость
    P.ean   = deg2rad([0; 0; 0]);       % Углы Эйлера(крен,тангаж,рысканье)

    P.Weight = (P.mass + P.Wing.Mass) * g;
    
    P.InitCond = [P.vel(1:2); P.pos(1:2)];
    %% ode45 option struct
    P.Options = odeset( 'RelTol',     1e-6,...
                        'AbsTol',     1e-6,...
                        'Events',     @EventFunction,...
                        'Vectorized', true,...
                        'MaxStep',    0.1);    
          %NOTE: We should not need to set MaxStep, but it seems that the
          %event detection in ode45 misses some events when it takes large
          %time steps, if the system dynamics are simple, as is the case
          %here, especially when there is negligable drag.
end


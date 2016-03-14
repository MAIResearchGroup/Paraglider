function dy = Model(t, x)
    %% Ќачальные параметры
    r     = x(1:3);     % рассто€ние до объекта
    v     = x(4:6);     % скорость
    omega = x(7:9);     % угол наклона траектории
    phi   = x(10:12);

    %% ѕараметры параплана
    width  = 1;
    height = 1;
    depth  = 1;
    
    mass = 2.0;         % kg
    S = 1.2*0.38;       % m, площадь крыла

    vP = [1; 0; 0];     % вектор направлени€ т€ги
    P = 0.4;            % т€га двигател€

    % —ила т€ги и момент
    FP = P*vP;
    MassPoint = [-0.5; -1; 0]; % положение точки приложени€ силы т€ги
    MP = cross(MassPoint, FP);
    
    % √равитационна€ сила и момент
    FG = [0; -1; 0]*9.81*(mass+mass/100);
    MG = cross([0; 0; 0], FG);
    
    Jxx = (1/12)*mass*(width^2  + depth^2);
    Jyy = (1/12)*mass*(height^2 + depth^2);
    Jzz = (1/12)*mass*(height^2 + width^2);
    J = [Jxx 0  0;
          0 Jyy 0;
          0  0 Jzz];

    %% ѕараметры внешней среды (неизмен€емые)
    ro = 1.225;         
    g = 9.81;

    %% –ешение
    % —умма сил и моментов
    F = FG + FP;
    M = MG + MP;
    Cx=0.1;
    Cy=0.1;
    Vw=5;
    
    vX = [0; 0; 0];
    X = Cx * ro * (Vw^2 / 2) *S;
    vY = [0; 0; 0];
    Y = Cy * ro * (Vw^2 / 2) *S;

%     dy = zeros(3, 1);
%         dy(1) =  -X/mass - G*sin(y(2))/mass + P*cos(alpha)/mass;
%         dy(2) =(P*(sin(alpha)) + Y - G*cos(y(2)))/(mass*y(1));
%         dy(3) = y(1)*sin(y(2));

    dr_dt     = v;
    dv_dt     = F/(mass+mass/100);
    domega_dt = inv(J)*M - inv(J)*cross(omega, J*omega);
    dphi_dt   = omega;
    
    dy = [dr_dt; dv_dt; domega_dt; dphi_dt];
end
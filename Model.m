function dy = Model(t, x)
    %% Начальные параметры
%        r     = x(1:3);     % положение
        v     = x(4:6);     % скорость
        omega = x(7:9);     % угловые скорости
        ean   = x(10:12);   % Углы Эйлера
        %TET   = x(13);
    
    %% Параметры внешней среды (неизменяемые)
        ro = 1.225; % Плотность воздуха        
        g  = 9.81;  % Ускорение свободного падения
        Vw = 5.0;   % Скорость набегающего потока
    
    %% Габариты груза (куб)
        width = 0.1;          % Ширина, м
        hight = 0.1;          % Высота, м
        depth = 0.1;          % Длина,  м

        mass1 = 2.0;           % масса груза, кг
    
    %% Двигатель аппарата
        vP = [1; 0; 0];        % вектор направления тяги
        P  = 4.45;             % тяга двигателя
    
    %% Габариты крыла
        mass2 = 0.2;           % масса крыла, кг

        lenght = 1.20;         % длина профиля,  м
        wide   = 0.38;         % ширина профиля, м
        c      = wide;         % под шириной будем понимать и среднюю хорду
                               % крыла
                               
        S      = lenght*wide;  % площадь крыла, м^2

        angle  = deg2rad(2);    % Угол атаки, рад
    
    %% Матрицы переходов
    %  R^u_b
        Rub = [ cos(ean(2))*cos(ean(3)), sin(ean(1))*sin(ean(2))*cos(ean(3)) - cos(ean(1))*sin(ean(3)), cos(ean(1))*sin(ean(2))*cos(ean(3)) + sin(ean(1))*sin(ean(3));...
                cos(ean(2))*sin(ean(3)), sin(ean(1))*sin(ean(2))*sin(ean(3)) + cos(ean(1))*cos(ean(3)), cos(ean(1))*sin(ean(2))*sin(ean(3)) - sin(ean(1))*cos(ean(3));...
               -sin(ean(2)),             sin(ean(1))*cos(ean(2)),              cos(ean(1))*cos(ean(2))];
    %  R_ea
        Rea = [1, sin(ean(1))*tan(ean(2)),  cos(ean(1))*tan(ean(2));...
               0, cos(ean(1)),             -sin(ean(1));...
               0, sin(ean(1))/cos(ean(2)),  cos(ean(1))/cos(ean(2))];

    %% Сила тяги и момент
        FPPoint = [-0.05; 0; 0];    % положение точки приложения силы тяги
        FP = P*vP;                  % Сила тяги
        MP = cross(FPPoint, FP);    % Момент тяги
    
    %% Гравитационная сила и момент
        MGPoint = [0; 0; 0];             % Центр масс
        TM = mass1 + mass2;              % Общая масса
        FG = Rub\[0; 0; 1]*g*(TM);  % Сила тяжести
        MG = cross(MGPoint, FG);         % Момент силы тяжести
    
    %% Коэфициент вращения для куба
        Jxx = (1/12)*mass1*(width^2  + depth^2);
        Jyy = (1/12)*mass1*(hight^2 + depth^2);
        Jzz = (1/12)*mass1*(hight^2 + width^2);
        J = [Jxx 0  0;
              0 Jyy 0;
              0  0 Jzz];

    %% Аэродинамика
    %  Чтение данных профиля и получение АД коэффициентов
        profile = ClarkYH(angle);
        Cy = profile(1);        % Коэф. подъемной  силы
        Cx = profile(2);        % Коэф. тормозящей силы 
%         Cm = profile(3);        % Коэф. момента передней кромки, пока не
%                                 % ясно зачем он нужен
        Cd = profile(4);        % Коэф. Центра давления
        
%        MAPoint = [0.1; 2; 0];  % Точка приложения АДС  

%         X       = [-1; 0; 0] * Cx * ro * (Vw^2 / 2) *S; % Тормозящая сила
%         Y       = [0;  1; 0] * Cy * ro * (Vw^2 / 2) *S; % Подъемная  сила
    
    % Общая АД сила
        FA      = ro*S*(Vw^2/2)*[-Cx*cos(angle)+Cy*sin(angle);...
                                  0;...
                                 -Cx*sin(angle)-Cy*cos(angle)];
%     MX = cross(MAPoint, X);
%     MY = cross(MAPoint, Y);  
    %  Момент АД сил
        MA = ro*S*(Vw^2/2)*[ 0;...
                             c*(Cd);...
                             0];

    %% Сумма сил и моментов
        F = FG + FP + FA;
        M = MG + MP + MA;
%        V = ((v(1)^2+v(2)^2)^2+v(3)^2); 
       
    %%  Интегрирование
        dr_dt     = Rub*v;
        dv_dt     = cross(omega, v) + (F/TM);
        dean_dt   = Rea*ean;
        domega_dt = J\M - J\cross(omega, J*omega);
    
%         dTET_dt   = (P*(sin(angle))+ Y(2) -FG(2)*cos(TET))/((mass1+mass2)*V);

%         dH_dt = dv_dt;

        dy = [dr_dt; dv_dt; domega_dt; dean_dt];
end
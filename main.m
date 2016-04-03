clc; close all; clear;

verify      = true;
useCBSAF    = true;
preload;
%%  Исходные данные    
    [E, P] = SetUp();    
    dynFunc = @(t,X)Model(t,X,P,E);
                        
%%  Интегрирование
    TimeSpan = 0:120;
    res = ode45(dynFunc, TimeSpan, P.InitCond, P.Options);
    
%%  Вывод результатов
    figure(1)
    PlotMapXY( res.y(3,:), res.y(4,:) )
    figure(2)
    PlotRes(res.x(1,:), res.y(3,:), ...
                        res.y(4,:), ...
                        res.y(1,:), ...
                        res.y(2,:))
    figure(3)
    PlotResAng( res.x(1,:), rad2deg( res.y(5,:) ),... 
                            rad2deg( res.y(6,:) ) )
function [] = PlotRes(AllTime, x, y, Vx, Vy)
    subplot (2, 2, 1)
    plot(AllTime, x)
    title('Изменение положения по оси Х от времени')
    xlabel('Время, с')
    ylabel('Дальность, м')
    grid on
    subplot (2, 2, 2)
    plot(AllTime, y)
    title('Изменение положения по оси Y от времени')
    xlabel('Время, с')
    ylabel('Высота, м')
    grid on
    subplot (2, 2, 3)
    plot(AllTime, Vx)
    title('Изменение скорости по оси Х от времени')
    xlabel('Время, с')
    ylabel('V_x, м/с')
    grid on
    subplot (2, 2, 4)
    plot(AllTime, Vy)
    title('Изменение скорости по оси Y от времени')
    xlabel('Время, с')
    ylabel('V_y, м/с')
    grid on
end
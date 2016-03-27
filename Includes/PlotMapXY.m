function [] = PlotMapXY(X, Y)
    plot(X, Y)
    title('Изменение положения аппарата от времени')
    xlabel('Дальность, м')
    ylabel('Высота, м')
    m = max(axis);
    axis([0 m 0 m])
    grid on
end
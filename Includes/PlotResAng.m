function [ ] = PlotResAng( AllTime, theta, attack )
    subplot (2, 1, 1)
    plot(AllTime, theta)
    title('Изменение угла наклона траектории к горизонту от времени')
    xlabel('Время, с')
    ylabel('Угол, град')
    grid on
    subplot (2, 1, 2)
    plot(AllTime, attack)
    title('Изменение угла атаки от времени')
    xlabel('Время, с')
    ylabel('Угол, град')
    grid on
end


function [] = PlotMapXY(X, Y)
    plot(X, Y)
    title('��������� ��������� �������� �� �������')
    xlabel('���������, �')
    ylabel('������, �')
    m = max(axis);
    axis([0 m 0 m])
    grid on
end
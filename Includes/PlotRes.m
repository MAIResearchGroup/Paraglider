function [] = PlotRes(AllTime, x, y, Vx, Vy)
    subplot (2, 2, 1)
    plot(AllTime, x)
    title('��������� ��������� �� ��� � �� �������')
    xlabel('�����, �')
    ylabel('���������, �')
    grid on
    subplot (2, 2, 2)
    plot(AllTime, y)
    title('��������� ��������� �� ��� Y �� �������')
    xlabel('�����, �')
    ylabel('������, �')
    grid on
    subplot (2, 2, 3)
    plot(AllTime, Vx)
    title('��������� �������� �� ��� � �� �������')
    xlabel('�����, �')
    ylabel('V_x, �/�')
    grid on
    subplot (2, 2, 4)
    plot(AllTime, Vy)
    title('��������� �������� �� ��� Y �� �������')
    xlabel('�����, �')
    ylabel('V_y, �/�')
    grid on
end
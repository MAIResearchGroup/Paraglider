function [ ] = PlotResAng( AllTime, theta, attack )
    subplot (2, 1, 1)
    plot(AllTime, theta)
    title('��������� ���� ������� ���������� � ��������� �� �������')
    xlabel('�����, �')
    ylabel('����, ����')
    grid on
    subplot (2, 1, 2)
    plot(AllTime, attack)
    title('��������� ���� ����� �� �������')
    xlabel('�����, �')
    ylabel('����, ����')
    grid on
end


clc;
clear all;

RandomNumber = 1000; %����� ��������� �����
ExpValue = 1/2; %�������������� ��������
Disp = 1/12; %���������
ArrayNumber = 1000;% ����� ������� �������� �����

for i=1:1:ArrayNumber+1
    Random = rand(RandomNumber,1); %�������� ��������� ���������
    Sum(i) = sum(Random); %���������� ����� ����
    Ans(i) = (Sum(i)-RandomNumber*ExpValue)/sqrt(Disp)/sqrt(RandomNumber); %������������� ������������� ��������
end

histfit(Ans,5000,'normal')

Min = min(Ans); %��� �����
Max = max(Ans); %���� �����
disp(Min)
disp(Max)

StepNumber = 99;

Step = (3 + 3)/StepNumber; %��� ��� ����������� ������
Deltanum = zeros(1,StepNumber+3);

for i = 1:1:StepNumber+3
    Delta(i) = -3 + (i-1)*Step; %����������� ������ ���������
end

for i = 1:1:length(Ans)
    if (Ans(i)<-3)
        Deltanum(1) = Deltanum(1)+1;
    elseif (Ans(i)>3)
        Deltanum(StepNumber+3) = Deltanum(StepNumber+3)+1;
    else
        for j = 2:1:StepNumber+2
            if (Ans(i)>=Delta(j)) && (Ans(i)<Delta(j+1))
                Deltanum(j) = Deltanum(j)+1;
            else
                Deltanum(j) = Deltanum(j)+0;
            end
        end
    end
end

p = normcdf([-3 3]);
P = p(2) - p(1) %����������� ��������� �� -3 �� 3
StrikeValue = P*length(Ans); %����������� ��������� ������
SUM = sum(Deltanum)-Deltanum(1)-Deltanum(StepNumber+3) %����������� ��������� ��������
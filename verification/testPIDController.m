Eps = 1e-4;

Time = 1;
step = 0.01;

need = 10;

Kp = 1; Ki = 1.5; Kd = 0.5;

ourPID.Kp = Kp; ourPID.Ki = Ki; ourPID.Kd = Kd;
ourPID.prevTime = 0;

ourPID.Prop = 0; ourPID.Der  = 0;
ourPID.Int  = 0; ourPID.I    = 0;

ourPID.Error = 0; ourPID.value = 0; ourPID.state = [0; 0];

%% Считаем для всего времени моделирования с постоянным шагом
    feed1 = 1;
    feed2 = 1;

    dt = step;           
    n = round(Time/dt); 

    Prop(1:n+1) = 0; Der(1:n+1) = 0; Int(1:n+1) = 0; I(1:n+1) = 0;
    PIDvalue(1:n+1) = 0;
    FeedBack(1:n+1) = 0;
    Output(1:n+1) = 0;
    Error(1:n+1) = 0;
    state1(1:n+1) = 0; STATE1(1:n+1) = 0;
    state2(1:n+1) = 0; STATE2(1:n+1) = 0;

    for i = 1:n
        Error(i+1) = need - FeedBack(i);           

        Prop(i+1) = Error(i+1);                       
        Der(i+1)  = (Error(i+1) - Error(i))/dt;    
        Int(i+1)  = (Error(i+1) + Error(i))*dt/2;
        I(i+1)    = sum(Int);                           

        PIDvalue(i+1)  = Kp*Prop(i) + Ki*I(i+1)+ Kd*Der(i);  

        STATE1(i+1) = sum(PIDvalue);                       
        state2(i+1) = (STATE1(i+1) + STATE1(i))*dt/2;  
        STATE2(i+1) = sum(state2);                      
        Output(i+1) = (STATE2(i+1) + STATE2(i))*dt/2;   
        FeedBack(i+1) = state2(i+1)*feed1 + Output(i+1)*feed2;
    end

%% Переходим к тестируемой функции
ourFeedBack = 0;
steps = Time/step;
r = zeros(1, steps);
for i = 1:steps
    [ ourOut, ourFeedBack, ourPID ] = PIDCycle( i*step, need, ourFeedBack, ourPID );
    tmp1 = round( ourOut/Eps )     *Eps;
    tmp2 = round( Output(i+1)/Eps )*Eps;
    if tmp1 ~= tmp2 && i >= 2
        ourOut
        Output(i+1)
        error('WTF')
    end
end
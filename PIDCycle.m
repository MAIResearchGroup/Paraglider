function [ Output, FeedBack, PID ] = PIDCycle( time, desired, FeedBack, PID )
    dt           = time - PID.prevTime;
    PID.prevTime = time;

    feed = 1;

    PrevProp  = PID.Prop;
    PrevDer   = PID.Der;
    PrevInt   = PID.I;
    PrevError = PID.Error;
    
    PID.Error = desired - FeedBack;               % error entering the PID controller

    PID.Prop = PID.Error;                         % error of proportional term
    PID.Der  = (PID.Error - PrevError)/dt;        % derivative of the error
    PID.Int  = (PID.Error + PrevError)*dt/2;      % integration of the error
    PID.I    = PrevInt + PID.Int;                 % the sum of the integration of the error

    PrevPIDvalue = PID.state(1);
    PID.value  = PID.Kp*PrevProp + PID.Ki*PID.I+ PID.Kd*PrevDer;  % the three PID terms

    PrevState = PID.state;
    PID.state(1) = PrevPIDvalue + PID.value;      % sum PID term to calculate the first integration
    state2 = (PID.state(1) + PrevState(1))*dt/2;  % output after the first integrator
    PID.state(2) = PID.state(2) + state2;         % sum output of first integrator to calculate the second integration
    Output = (PID.state(2) + PrevState(2))*dt/2;  % output of the system after the second integrator
    FeedBack = state2*feed + Output*feed;
end


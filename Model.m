function r = Model( ~, state, P )
    vel = state(1:2);
    pos = state(3:4);
    
    Y = P.Wing.Cy * P.Env.Wind.Pressure * P.Wing.S;
    X = P.Wing.Cx * P.Env.Wind.Pressure * P.Wing.S;

    pos(1) = vel(1);
    pos(2) = vel(2);
    vel(1) = (P.Thrust - X)/P.mass;
    vel(2) = (Y - P.Weight)/P.mass;
    
    r = [vel(1); vel(2); pos(1); pos(2)];
end
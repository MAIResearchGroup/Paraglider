function r = Model( ~, state, P )
    vel = state(1:2);
    pos = state(3:4);
    
    vLen = @(vel) sqrt(vel(1)^2+vel(2)^2);
    
    Y = P.Wing.Cy * P.ro*(vLen(vel)^2)/2 * P.Wing.S;
    X = P.Wing.Cx * P.ro*(vLen(vel)^2)/2 * P.Wing.S;

    pos(1) = vel(1);
    pos(2) = vel(2);
    vel(1) = (P.Thrust - X)/P.mass;
    vel(2) = (Y - P.Weight)/P.mass;
    
    r = [vel(1); vel(2); pos(1); pos(2)];
end
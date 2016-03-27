function r = Model( t, state, P, Env )
    vel = state(1:2);
    pos = state(3:4);
    
    if t > 10
        P.Thrust = 0.178 * P.Thrust;
    end
    
    Y = P.Wing.Cy * Env.AirDen*(vel(1)^2)/2 * P.Wing.S;
    X = P.Wing.Cx * Env.AirDen*(vel(1)^2)/2 * P.Wing.S;

    pos(1) = vel(1);
    if pos(2) <= 0 && vel(2) < 0
        pos(2) = 0;
    else
        pos(2) = vel(2);
    end
    vel(1) = (P.Thrust * cos(deg2rad(P.attack)) - X)/P.SMass;
    vel(2) = (Y - P.Weight + P.Thrust * sin(deg2rad(P.attack)))/P.SMass;
    
    r = [vel(1); vel(2); pos(1); pos(2)];
end
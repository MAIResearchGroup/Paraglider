function r = Model( t, state, P, Env )
    vel = state(1:2);
    pos = state(3:4);
    theta  = deg2rad(state(5));
    attack = deg2rad(state(6));
    
    [P.Wing.Cy, ...
     P.Wing.Cx, ... 
     P.Wing.CmA,... 
     P.Wing.Cd] = feval(P.Wing.FoilName,rad2deg(attack));
    
    Vel = sqrt(vel(1)^2 + vel(2)^2);
    if t > 5
        P.Thrust = 0.1 * P.Thrust;
    end
    
    Y = P.Wing.Cy * Env.AirDen*(vel(1)^2)/2 * P.Wing.S;
    X = P.Wing.Cx * Env.AirDen*(vel(1)^2)/2 * P.Wing.S;

    pos(1) = vel(1);
    if pos(2) <= 0 && vel(2) < 0
        pos(2) = 0;
    else
        pos(2) = vel(2);
    end
    dV = (P.Thrust * [cos(theta); sin(theta)] + [-X; Y-P.Weight])/P.SMass;
    dtheta  = (P.Thrust *(sin(attack)) + Y - P.Weight *cos(theta))/(P.Weight * Vel/Env.g);
    dattack = 0;
    
    r = [dV(1); dV(2); pos(1); pos(2); dtheta; dattack];
end

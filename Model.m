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
    if t > 10
        P.Thrust = 0 * P.Thrust;
    end
    
    Y = P.Wing.Cy * Env.AirDen*(vel(1)^2)/2 * P.Wing.S;
    X = P.Wing.Cx * Env.AirDen*(vel(1)^2)/2 * P.Wing.S;
    
    dV = (P.Thrust * [cos(theta); sin(theta)] + [-X; Y-P.Weight])/P.SMass;
    if (pos(2) <= 0) && (dV(2) < 0)
        dV(2) = 0;
    end
    pos = vel;
    dtheta  = (P.Thrust *(sin(attack)) + Y - P.Weight *cos(theta))/(P.SMass * Vel);
    dattack = 0;
    
    r = [dV; pos; rad2deg(dtheta); rad2deg(dattack)];
end

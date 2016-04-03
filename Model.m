function r = Model( t, state, P, Env )
    vel     = state(1:2);
    pos     = state(3:4);
    theta   = state(5);
    attack  = state(6);
    thrust  = state(7);
    
    [P.Wing.Cy, ...
     P.Wing.Cx, ... 
     P.Wing.CmA,... 
     P.Wing.Cd] = feval(P.Wing.FoilName,rad2deg(attack));
    
    [Env.AirTemperature,...
     Env.AirPressure,...
     Env.AirDensity] = (StdEarthAtmo(pos(2)));
 
    Vel = sqrt(vel(1)^2 + vel(2)^2);
    
    need = 300;
    FeedBack = pos(2);
    [ dThrust, FeedBack, P.PID ] = PIDCycle( t, need, FeedBack, P.PID );
    if pos(2) > need
        dThrust = -11;
    elseif pos(2) < need
        dThrust = +11;
    end
    thrust = dThrust;
    
    Y = P.Wing.Cy * Env.AirDensity*(vel(1)^2)/2 * P.Wing.S;
    X = P.Wing.Cx * Env.AirDensity*(vel(1)^2)/2 * P.Wing.S;
    
    dV = (thrust * [cos(theta); sin(theta)] + [-X; Y-P.Weight])/P.SMass;
    if (pos(2) <= 0) && (dV(2) < 0)
        dV(2) = 0;
    end
    pos = vel;
    dtheta  = (thrust *(sin(attack)) + Y - P.Weight *cos(theta))/(P.SMass * Vel);
    dattack = -dtheta;
    
    r = [dV; pos; dtheta; dattack; thrust];
end

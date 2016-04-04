function r = Model( t, state, P, Env )
    vel     = state(1:2);
    pos     = state(3:4);
    theta   = state(5);
    attack  = state(6);
    
    global PID;
    
    [P.Wing.Cy, ...
     P.Wing.Cx, ... 
     P.Wing.CmA,... 
     P.Wing.Cd] = feval(P.Wing.FoilName,rad2deg(attack));
    
    [Env.AirTemperature,...
     Env.AirPressure,...
     Env.AirDensity] = ( ISA(pos(2)) );
 
    Vel = sqrt(vel(1)^2 + vel(2)^2);
    
    % состояние структуры не меняется в модели, поэтому применение ПИД
    % регулятора затруднено
    % USE GLOBAL, LUKE!
    
    need = 300;
    [ ~, PID.feedback, PID ] = PIDCycle( t, need, pos(2), PID );
    if PID.Error >= 0
        P.Thrust = 11;
    elseif PID.Error < 0
        P.Thrust = -11;
    end
    
    Y = P.Wing.Cy * Env.AirDensity*(vel(1)^2)/2 * P.Wing.S;
    X = P.Wing.Cx * Env.AirDensity*(vel(1)^2)/2 * P.Wing.S;
    
    dV = (P.Thrust * [cos(theta); sin(theta)] + [-X; Y-P.Weight])/P.SMass;
    if (pos(2) <= 0) && (dV(2) < 0)
        dV(2) = 0;
    end
    pos = vel;
    dtheta  = (P.Thrust *(sin(attack)) + Y - P.Weight *cos(theta))/(P.SMass * Vel);
    dattack = -dtheta;
    
    r = [dV; pos; dtheta; dattack];
end

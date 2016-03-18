function [ Obj ] = Model( ~, Obj, Env )
    Y = Obj.Wing.Cy * Env.Wind.Pressure * P.Wing.S;
    X = Obj.Wing.Cx * Env.Wind.Pressure * P.Wing.S;

    Obj.pos(1) = Obj.vel(1);
    Obj.pos(2) = Obj.vel(2);
    Obj.vel(1) = (Obj.Thrust - X)/Obj.Wing.Mass;
    Obj.vel(2) = (Y - Obj.Weight)/Obj.Wing.Mass;
end
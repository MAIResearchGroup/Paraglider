function [value,isterminal,direction] = EventFunction(~,X)
    value = X(4)-0;
    
    %Stop if the hit the ground
    isterminal = true;

    %Should only be coming to the ground from above
    direction = -1;
end
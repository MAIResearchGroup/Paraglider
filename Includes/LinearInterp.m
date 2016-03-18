function [ res ] = LinearInterp( arguments, functionValues, value )
    len = numel(arguments);

    if value <= arguments(1)
        res = functionValues(1);
        return
    end
    
    if value >= arguments(end)
        res = functionValues(end);
        return
    end
   
    koeff(1) = 1;
    koeff(2) = 1;

    for i = 2:len
        if value >= arguments(i-1) 
            koeff(1) = (functionValues(i) - functionValues(i-1)) / (arguments(i) - arguments(i-1));
            koeff(2) = functionValues(i-1) - koeff(1)*arguments(i-1);
            break
        end
    end
    res = koeff(2) + koeff(1)*value;
end
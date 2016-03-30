function [ res ] = LinearInterp( arguments, functionValues, value )
    first = 1;
    last = numel(arguments);

    if value <= arguments(1)
        res = functionValues(1);
        return
    end
    
    if value >= arguments(last)
        res = functionValues(end);
        return
    end
   
    while abs(first - last) ~= 1
        mid = round((first + last)/2);
        if (arguments(first) - value)*(arguments(mid) - value) <= 0
            last = mid;
        else
            first = mid;
        end
    end
    res = (functionValues(first) - ((functionValues(last) - functionValues(first)) / (arguments(last) - arguments(first)))*arguments(first)) + ((functionValues(last) - functionValues(first)) / (arguments(last) - arguments(first)))*value;
end
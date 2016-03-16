function [ resF, resP ] = ConcurrentForces(F1, pos1, F2, pos2)
    resF  = F1 + F2;
    if (sign(F1) == sign(F2))
        if F1 > F2
            k = F2/F1;
        else
            k = F1/F2;
        end
        pos2_ = pos2 - pos1;
        resP_ = pos2_ * k;
        resP  = resP_ + pos1;
    else
        if abs(F1) > abs(F2)
            if abs(F2) > (F1 - F2)
                k = abs(F2)/abs(F1 - abs(F2));
            else
                k = abs(F1 - abs(F2))/abs(F2);
            end
        pos1_ = pos1 - pos2;
        resP_ = pos1_ * k;
        resP  = resP_ + pos2;
        else
            if abs(F1) > abs(F2 - abs(F1))
                k = abs(F1)/abs(F2 - abs(F1));
            else
                k = abs(F2 - abs(F1))/abs(F1);
            end
        pos2_ = pos2 - pos1;
        resP_ = pos2_ * k;
        resP  = resP_ + pos1;
        end
    end
end
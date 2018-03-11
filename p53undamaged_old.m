function [ next ] = p53undamaged( x, F, varF, nv )

    next_0 = bnRun(x,F,varF,nv,1);
    next = next_0(end,:);
    
end


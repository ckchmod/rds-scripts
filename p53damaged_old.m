function [ next ] = p53undamaged( x, F, varF, nv )

    next_0= bnRun(x,F,varF,nv,1);
    next = next_0(end,:);
    if (isequal(next_0(1,:), [0, 1 , 0, 0, 1])) % 9
        next = [0,0,0,0,1];
    elseif (isequal(next_0(1,:), [1, 1 , 0, 0, 1])) %25
        next = [0,1,0,0,1];
    elseif (isequal(next_0(1,:), [0, 0 , 1, 0, 1])) %7
        next = [0, 0, 1, 1 ,1];
    elseif (isequal(next_0(1,:), [0, 0 , 0, 0, 1])) %1
        next = [0, 0, 1, 0 ,1];  
    elseif (isequal(next_0(1,:), [1, 0 , 0, 1, 1])) %19
        next = [0, 1, 1, 0 ,1];  
    elseif (isequal(next_0(1,:), [0, 1 , 1, 0, 1])) %13
        next = [0, 0, 0, 1 ,1];  
    elseif (isequal(next_0(1,:), [1, 1 , 0, 1, 1])) %27
        next = [1,1,0,0,1];    
    %second attractor
    elseif (isequal(next_0(1,:), [1, 1 , 1, 1, 1])) %31
        next = [0, 1, 0, 1 ,1];      
    elseif (isequal(next_0(1,:), [1, 0 , 1, 1, 1])) %23
        next = [0, 1, 1, 1 ,1];  
    end

end


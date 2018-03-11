clear all; clc;
load('p53_network/F.mat')
load('p53_network/nv.mat')
load('p53_network/varF.mat')
load('p53_network/accept_states.mat')

% randomly choose from correct initial

initState1 = accept_states(randi([1,20]),:);
initState2 = accept_states(randi([1,20]),:);

t = 100; %time step duration
c_1 = .4; %i.i.d.
%% 2 point trajectories

trajec = zeros(2:1); 
trajec(1,1) = bin2dec(num2str(initState1));
trajec(2,1) = bin2dec(num2str(initState2));
step1 = initState1;
step2 = initState2;
step1_dec = 0;
step2_dec = 0;
for i=1:t
    if(rand > c_1)
        step1 = p53damaged(step1,F,varF,nv);
        step1_dec = bin2dec(num2str(step1));
        step2 = p53damaged(step2,F,varF,nv);
        step2_dec = bin2dec(num2str(step2));
    else
        step1 = p53undamaged(step1,F,varF,nv);
        step1_dec = bin2dec(num2str(step1));
        step2 = p53undamaged(step2,F,varF,nv);
        step2_dec = bin2dec(num2str(step2));
    end
    trajec = [trajec, [step1_dec;step2_dec]];
end

plot(1:t+1,trajec);xlabel('Time Steps'); ylabel('States');

%[A,Avec] = bnAsparse(Fgood,varFgood,nvgood);
%spy(A);
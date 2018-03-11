clear all; clc;
load('p53_network/F.mat')
load('p53_network/nv.mat')
load('p53_network/varF.mat')
load('p53_network/accept_states.mat')

% randomly choose from correct initial

initState1 = accept_states(randi([1,20]),:);
initState2 = accept_states(randi([1,20]),:);

t = 2; %time step duration
lambda = 30; 
ns = 1;
radiation_duration = 10;
%% 2 point trajectories

trajec = zeros(2:1); 
trajec(1,1) = bin2dec(num2str(initState1));
trajec(2,1) = bin2dec(num2str(initState2));
step1 = initState1;
step2 = initState2;
step1_dec = 0;
step2_dec = 0;

for i=1:t
    t_healthy = PoissonSamp(lambda,ns);
    for t_h = 1:t_healthy
        step1 = p53undamaged(step1,F,varF,nv);
        step1_dec = bin2dec(num2str(step1));
        step2 = p53undamaged(step2,F,varF,nv);
        step2_dec = bin2dec(num2str(step2));
        trajec = [trajec, [step1_dec;step2_dec]];
    end
    for t_r = 1:radiation_duration
        step1 = p53damaged(step1,F,varF,nv);
        step1_dec = bin2dec(num2str(step1));
        step2 = p53damaged(step2,F,varF,nv);
        step2_dec = bin2dec(num2str(step2));
        trajec = [trajec, [step1_dec;step2_dec]];
    end
end

plot(1:(size(trajec,2)),trajec);xlabel('Time Steps'); ylabel('States');

%[A,Avec] = bnAsparse(Fgood,varFgood,nvgood);
%spy(A);
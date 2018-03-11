%% Synchronization Test
clear all; clc;
t = 500; %time step duration
c_1 = .5; %switching probability between two F_1, F_2 if rand > c_l, F1

% 3 gene test case 
n=5; %5th node extension
% load('p53_network/F.mat')
% load('p53_network/nv.mat')
% load('p53_network/varF.mat')
varF_1 = varF;
nv_1 = nv;
F_1 = F;

load('p53_network_undamaged/Fgood.mat')
load('p53_network_undamaged/nvgood.mat')
load('p53_network_undamaged/varFgood.mat')
varF_2 = varFgood;
nv_2 = nvgood;
F_2 = Fgood;
% synchronize
initState1 = [0, 1, 0, 0 , 1];
initState2 = [1, 1, 1, 0, 0];

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
        step1 = bnNextState(step1,F_1,varF_1,nv_1);
        step1_dec = bin2dec(num2str(step1));
        step2 = bnNextState(step2,F_1,varF_1,nv_1);
        step2_dec = bin2dec(num2str(step2));
    else
        step1 = bnNextState(step1,F_2,varF_2,nv_2);
        step1_dec = bin2dec(num2str(step1));
        step2 = bnNextState(step2,F_2,varF_2,nv_2);
        step2_dec = bin2dec(num2str(step2));
    end
    trajec = [trajec, [step1_dec;step2_dec]];
end

plot(1:t+1,trajec);xlabel('Time Steps'); ylabel('States');
n=5; %6th node extension
nf = [ 1, 1, 1, 1, 2]; 
varF = [5,1,2,3,1,1;-1,-1,-1,-1,4,4]
cij = [1,1,1,1,1-c_1; -1,-1,-1,-1,c_1];
nv = [1, 1, 1, 1, 2, 2];
F = [1,0,1,0,0,0;
    0,1,0,1,0,0;
    -1,-1,-1,-1,1,0;
    -1,-1,-1,-1,0,0];
bnA(F_1,varF_1,nv_1,0,'full')
bnA(F_2,varF_1,nv_1,0,'full')
[A,v] = pbnA(F,varF,nf,nv,cij,0);
A
v
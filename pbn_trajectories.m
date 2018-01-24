%% Synchronization Test
clear all; clc;
t = 500; %time step duration
c_1 = .5; %switching probability between two F_1, F_2 if rand > c_l, F1

% 3 gene test case 
n=3; %5th node extension
varF_1 = [1,1,1;2,2,2;3,3,3];
nv_1 = [3, 3, 3];
F_1 = [1,1,0;
    1,1,0;
    1,0,1;
    1,1,1;
    0,1,1;
    0,0,1;
    1,1,1;
    0,0,0];
F_2 = [1,1,0;
    0,1,0;
    0,0,1;
    1,1,1;
    0,1,1;
    0,0,1;
    1,1,1;
    1,0,0];
% synchronize
initState1 = [0, 1, 0];
initState2 = [1, 1, 1];
% do not synchronize
%initState1 = [0, 0, 0];
%initState2 = [1, 1, 1];

% % 5 gene test case
% n=5;
% varF_1 = [1,1,1,1,1;2,2,2,2,2;3,3,3,3,3;4,4,4,4,4;5,5,5,5,5];
% nv_1 = [5, 5, 5, 5, 5];
% F_1 = [1,1,0,0,1;
%     1,1,0,0,0;
%     1,0,1,1,1;
%     1,1,0,1,0;
%     1,1,1,0,0;
%     1,0,1,0,0;
%     1,1,0,1,1;
%     0,0,1,1,0;
%     0,1,0,0,1;
%     0,0,0,1,0;
%     0,0,0,1,0;
%     1,1,0,0,0;
%     1,0,1,0,0;
%     0,1,1,0,1;
%     0,1,1,0,0;
%     1,0,1,1,1;
%     1,1,0,0,1;
%     1,1,0,0,0;
%     1,0,1,1,1;
%     1,1,0,1,0;
%     0,1,0,0,0;
%     1,0,1,0,0;
%     1,1,1,0,1;
%     0,0,1,1,0;
%     0,1,1,0,1;
%     0,1,1,0,0;
%     0,0,0,1,0;
%     1,1,0,0,0;
%     1,0,0,1,0;
%     1,0,1,1,1;
%     1,1,0,0,1;
%     0,0,1,1,0];
% F_2 = [1,1,0,0,1;
%     1,1,0,0,0;
%     0,0,1,1,0;
%     1,0,0,1,1;
%     1,1,1,0,0;
%     1,0,1,0,0;
%     0,1,0,1,1;
%     1,0,1,1,0;
%     1,1,0,0,1;
%     1,0,0,0,0;
%     1,0,1,0,0;
%     1,1,0,0,0;
%     0,0,1,0,0;
%     0,1,1,0,1;
%     1,1,1,0,0;
%     0,0,1,1,0;
%     1,0,0,0,1;
%     0,0,0,0,0;
%     1,1,1,1,1;
%     0,1,0,1,0;
%     0,1,0,0,0;
%     1,0,1,0,0;
%     1,1,1,0,1;
%     0,0,1,1,0;
%     0,1,0,0,1;
%     0,1,1,0,0;
%     1,0,0,1,0;
%     1,1,0,1,0;
%     1,0,0,1,0;
%     0,0,1,1,1;
%     0,1,0,0,1;
%     1,0,1,1,1];
% initState1 = [1, 0, 1, 1, 0];
% initState2 = [1, 0, 0, 0, 0];

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
        step1 = bnNextState(step1,F_2,varF_1,nv_1);
        step1_dec = bin2dec(num2str(step1));
        step2 = bnNextState(step2,F_2,varF_1,nv_1);
        step2_dec = bin2dec(num2str(step2));
    end
    trajec = [trajec, [step1_dec;step2_dec]];
end

plot(1:t+1,trajec);xlabel('Time Steps'); ylabel('States');
title('2-state Trajectories of Probabilistic Network Selection');


% %% PBN context
% p=0;
% cij = [1-c_1,1,1,1,1; c_1,-1,-1,-1,-1];
% varF = [1,1,1,1,1,1;2,2,2,2,2,2;3,3,3,3,3,3;4,4,4,4,4,4;5,5,5,5,5,5];
% F = [1,1,1,0,0,1;
%     1,1,1,0,0,0;
%     1,0,0,1,1,1;
%     1,1,1,0,1,0;
%     1,1,1,1,0,0;
%     1,1,0,1,0,0;
%     1,0,1,1,1,1;
%     0,1,0,1,1,0;
%     0,1,1,0,0,1;
%     0,1,0,0,0,0;
%     0,1,0,0,1,0;
%     1,1,1,0,0,0;
%     1,0,0,1,0,0;
%     0,0,1,1,0,1;
%     0,1,1,1,0,0;
%     1,0,0,1,1,1;
%     1,1,1,0,0,1;
%     1,0,1,0,0,0;
%     1,1,0,1,1,1;
%     1,0,1,0,1,0;
%     0,0,1,0,0,0;
%     1,1,0,1,0,0;
%     1,1,1,1,0,1;
%     0,0,0,1,1,0;
%     0,0,1,0,0,1;
%     0,0,1,1,0,0;
%     0,1,0,0,1,0;
%     1,1,1,0,0,0;
%     1,1,0,0,0,0;
%     1,0,0,1,0,1;
%     1,0,1,0,0,1;
%     0,1,0,1,1,0];
% nf = [ 2, 1, 1, 1, 1]; 
% nv = [5, 5, 5, 5, 5, 5];
% pbnA - state transition matrix of a PBN
% v - steady state distribution
%[A,v] = pbnA(F,varF,nf,nv,cij,0);
n=3; %5th node extension
nf = [ 2, 1, 1]; 
varF = [1,1,1,1;2,2,2,2;3,3,3,3];
cij = [1-c_1,1,1; c_1,-1,-1];
nv = [3, 3, 3, 3];
F = [1, 1, 1,0;
    1, 0, 1,0;
    1, 0, 0,1;
    1, 1, 1,1;
    0, 0, 1,1;
    0, 0, 0,1;
    1, 1, 1,1;
    0, 1, 0,0];
bnA(F_1,varF_1,nv_1,0,'full')
bnA(F_2,varF_1,nv_1,0,'full')
[A,v] = pbnA(F,varF,nf,nv,cij,0);
A
v
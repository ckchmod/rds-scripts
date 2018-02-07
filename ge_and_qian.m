clear all; clc;
load('p53_network/F.mat')
load('p53_network/nv.mat')
load('p53_network/varF.mat')
nsteps = 1;
x = [1, 1, 0, 0, 1];
next = bnRun(x,F,varF,nv,nsteps);
bin2dec(num2str(next(end,:))) 

[A,Avec] = bnAsparse(F,varF,nv);
spy(A);
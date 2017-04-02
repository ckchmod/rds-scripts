clear all; clc;
load( 'pbn-ex3.mat' ); %<- example pbn stored in .mat
% Alternatively, run pbnRnd.m to create a random pbn
% pbnRnd(n,nf,nv)
% n = number of nodes, nf = number of functions in vector, nv = number of
% variables for each function.

% pbnRnd(3, [ 3, 3, 2 ], [3, 3, 3, 3, 3, 3, 3, 3]);
[ M, cn ] = pbn_to_markov( F, cij );
[ RDS ] = markov_to_rds( M, cn );
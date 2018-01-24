% Tarjan algorithm for finding strongest connected component
% matrix A is irreducible if and only if the directed graph D(A) is strongly
% connected. (RICHARD A. BRUALDI)

% PBN to sparse matrix E
numGenes = size(cij,2);
rows = size(F, 1);
cols = size(F, 2);

%find sizes of Function Classes
a= zeros(1,numGenes);
for i=1:numGenes
    count = 0;
    for j = 1:size(cij,1)
        if (cij(i,j) ~= -1)
            count = count + 1;
        end
    end
    a(1,i)=count; %functions 3, 3, 2
end
     
b = [];
c = [];
for i = 1:size(F,2)
    nf_index = 1;
    for j = 1:size(a,2)
        bin{j} = F( i, nf_index:nf_index + a( j ) - 1 );
        nf_index = nf_index + a(j);
        %b = [b, bin2dec(num2str(bin{j}))]
    end
    comb = allcomb(bin{:});
    for r = 1:size(comb,1)
        b = [b, bin2dec(num2str(comb(r,:)))];
        c = [c, i];
    end
end
b = b + 1; %indexing from 1:n, not 0:n-1

E = sparse(b, ... 
c, ... 
ones(1,length(b))); 
figure; spy(E) 
irreduce = tarjan(E) %largest strongly connected component in the graph.

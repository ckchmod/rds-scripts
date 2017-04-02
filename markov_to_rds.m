function [ RDS ] = markov_to_rds( M, cn )
    % This function returns RDS decomposition of Markov Matrix
    % Each row is the numerically translated "deterministic identity matrix"
    % RDS matrix is a concatenation of all the deterministic matrices

    [ M_row, M_col ] = size( M );
    cn_row = length( cn );
    RDS = zeros( cn_row, M_row) ;
    M_copy = M;
    for index = 1:cn_row
        for i = 1:M_row
            for j = 1:M_col
                %index = find
                if ( isempty( M{ i, j} ) ~= 1 )
                    if ( sum( ismember( M{ i, j }, cn( index, : ), 'rows' ) ) == 1)
                        RDS( index, i ) = j;
                    end
                end
            end
        end
    end
       
end


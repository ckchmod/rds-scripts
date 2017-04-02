function [ M, cn ] = pbn_to_markov( F, cij )
    % This function returns M and cn
    % M is Markov Chain
    % cn is the combinatorial list of cij. (i.e. c1 = c11 * c21 * c31)
    % number of functions per node = size(cij,1)

    % Find cn
    [ c_row, c_col ] = size( cij );
    [ F_row, F_col ] = size( F );
    for i = 1:c_col
        C{ i } = cij( :, i );
    end
    cn = allcomb( C{ : } );
    [ r, c ] = find( cn == -1 );
    for i = 1:length( r )
       cn( r( i ), : ) = [];
       r = r-1;
    end 

    % Double checking/storing nf 
    for i = 1:c_col
        count = 0;
        for j = 1:c_row
            if ( cij( i, j ) ~= -1 )
                count = count + 1;
            end
        end
        nf( i ) = count;
    end

    % Turn truth table into Markov Chain using cn and nf
    M = cell( F_row, F_row );
    for i = 1:F_row
        nf_index=1;
        for j = 1:length( nf )
            bin{ j}  = F( i, nf_index:nf_index + nf( j ) - 1 );
            nf_index = nf_index + nf( j );
        end
        bin_comb = allcomb( bin{ : } );
        bin_row = size( bin_comb, 1 );
        bin_index = zeros( bin_row, 1 ); 
        for l = 1:bin_row
            bin_index( l ) = b2d( bin_comb( l, : ) ) + 1;
            M{ i, bin_index( l ) }= [ M{ i, bin_index( l ) }; cn( l, : ) ];
        end
    end
end

function [ wrt, T, V ] = KL( X, itr, K )
    
    tic;

    exe_time = 0;

    wrt = zeros( itr, 2 );

    % Get size
    [I,J] = size( X );

    % random initialization
    T = abs(randn( I, K ));
    V = abs(randn( K, J ));

    % avoid vibration 
    Xf = T * V;

    One = ones(I,J);
    % Iteration by MU
    for lp=1:itr

        T = T.*( ((X./Xf*V') ./repmat(sum(V,2)',I,1)));
  
        Xf = T * V;
        V = V.*( (T'*(X./Xf)) ./repmat(sum(T,1)',1,J));

        Xf = T * V;

        exe_time = exe_time + toc;
  
        % make KL-divergece
        error = sum(sum(X.*log(X./Xf)-X+Xf));
  
        wrt(lp,:) = [ exe_time  error ];
  
        tic;
  
   end

end

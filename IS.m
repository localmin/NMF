function [ wrt, T, V ] = IS( X, itr, K )

    tic;
    
    exe_time = 0;
    
    wrt = zeros( itr, 2 );
    
    % get size
    [I,J] = size( X );
    
    % random initialization
    T = abs(randn( I, K ));
    V = abs(randn( K, J ));
    
    % avoid vibration 
    Xf = T * V;
    
    One = ones(I,J);
    % Iteration by MU
    for lp=1:itr
    
      T = T.*sqrt(((X.*Xf.^-2)*V')./(Xf.^-1*V') );
    	
      Xf = T * V;	
    	V = V.*sqrt((T'*(X.*Xf.^-2))./(T'*Xf.^-1) );
      
      Xf = T * V;
      
      exe_time = exe_time + toc;
      
      % make IS-divergence
      error = sum(sum(X./Xf-log(X./Xf)-1));
      
      wrt(lp,:) = [ exe_time  error ];
      
      tic;
    end
    
end

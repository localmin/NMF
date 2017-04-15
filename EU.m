function [ T, V ] = EU( X, K, itr, I, J )

% Iteration
for loop=1:itr
  % create new variables
  tmpT = T;
  tmpV = V;
  % update T
  for i=1:R
    for k=1:K
      upper = 0;
      lower = 0;
      for j=1:C
        upper = upper + V(k,j) * X(i,j);
        lower = lower + V(k,j) * Xh(i,j);
      end
      nT(i,k) = T(i,k) * upper / lower;
    end
  end
  % update V
  for k=1:K
    for j=1:C
      upper = 0;
      lower = 0;
      for i=1:R
        upper = upper + T(i,k) * X(i,j);
        lower = lower + T(i,k) * Xh(i,j);
      end
      nV(k,j) = V(k,j) * upper / lower;
    end
  end
  % replace current variables to new ones
  V = nV; T = nT;
  % update \hat{X}
  Xh = T * V;
%  fprintf( 'Progress : %d / %d\n', loop, iter );
%  fflush( stdout );	 

  
end

end
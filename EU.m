function [ wrt, T, V ] = EU( X, itr, K )

tic;

exe_time = 0;

wrt = zeros( itr , 2 );

[I,J] = size( X );

% random initialization
T = abs(randn( I, K ));
V = abs(randn( K, J ));
 
Xf = T * V;

% Iteration by MU
for lp=1:itr
 
  % update T
  T = T .* ((X * V') ./ (Xf * V'));
  
  Xf = T * V;
  % update V
 	V = V .* ((T' * X) ./ (T' * Xf));

  Xf = T * V;
  
  
  exe_time = exe_time + toc;
  
  error = norm( X - Xf, 'fro' )^2;
  
  wrt(lp,:) = [ exe_time  error ];
  
  tic;

end


end
function [ wrt, T, V ] = EU( X, itr, K )

tic;

exe_time = 0;

wrt = zeros( itr , 2 );

[I,J] = size( X );

% random initialization
T = abs(randn( I, K ));
V = abs(randn( K, J ));

% avoid vibration 
Xf = T * V;

up = X(:)' * Xf(:);
low = Xf(:)' * Xf(:);

cf = sqrt( up / low );
T = T * cf;
V = V * cf;
Xf = Xf * cf * cf;

% Iteration by MU
for lp=1:itr

  tmpT = T;
  tmpV = V;
 
  % update T
  tmpT = T .* ((X * V') ./ (Xf * V'));
  	
  % update V
 	tmpV = V .* ((T' * X) ./ (T' * Xf));

  % replace variable
  V = tmpV; T = tmpT;
  % update Xf
  Xf = T * V;
  
  
  exe_time = exe_time + toc;
  
  error = norm( X - Xf, 'fro' );
  
  wrt(lp,:) = [ exe_time  error ];
  
  tic;

end


endfunction
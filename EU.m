function [ wrt, T, V ] = EU( X, itr, K )

tic;

exe_time = 0;

wrt = zeros( itr , 2 );

[I,J] = size( X );

% random initialization
T = rand( I, K );
V = rand( K, J );

% avoid vibration 
Xf = T * V;
up = 0;
low = 0;

for i=1:I
  for j=1:J
    up = up + ( X(i,j) * Xf(i,j) );
    low = low + ( Xf(i,j) * Xf(i,j) );
  end
end

cf = sqrt( up / low );
T = T * cf;
V = V * cf;
Xf = Xf * cf * cf;

% Iteration by MU
for lp=1:itr

  tmpT = T;
  tmpV = V;
 

  for k=1:K
  	% update T

  	up = X * V(k,:)';
  	low = Xf * V(k,:)';

  	tmpT(:,k)= T(:,k) .* (up ./ low);

  	% update V
 	  up = T(:,k)' * X;
  	low = T(:,k)'* Xf;

  	tmpV(k,:)= V(k,:) .* (up ./ low);
  end

  % replace variable
  V = tmpV; T = tmpT;
  % update Xf
  Xf = T * V;
  
  
  exe_time = exe_time + toc;
  
  error = norm( X - Xf, 'fro' );
  
  wrt(lp,:) = [ exe_time  error ];
  
  tic;

endfunction


end
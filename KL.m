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
up = 0;
low = 0;

up = X(:)' * Xf(:);
low = Xf(:)' * Xf(:);

cf = sqrt( up / low );
T = T * cf;
V = V * cf;
Xf = Xf * cf * cf;

One = ones(I,J);
% Iteration by MU
for lp=1:itr

  tmpT = T;
  tmpV = V;

  tmpT = T.*( ((X./max(Xf,1e-12))*V') ./repmat(sum(V,2)',I,1));

  tmpV = V.*( (T'*(X./max(Xf,1e-12))) ./repmat(sum(V,1)',1,J));

  % replace variables
  V = tmpV; T = tmpT;
  % update Xf
  Xf = T * V;

  exe_time = exe_time + toc;
  
  % make KL-divergece
  kl = (X .* log(X ./ Xf)) - X + Xf;
  KL = reshape( kl, I*J, 1 );
  error = norm( KL, 1 );
  
  wrt(lp,:) = [ exe_time  error ];
  
  tic;
  
end

endfunction
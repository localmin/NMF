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

  InXf = One ./ Xf;
  upSS = X ./ Xf;

  upS = upSS .* InXf;
  
  for k=1:K
    % update T
    up = upS * V(k,:)';
    low = InXf * V(k,:)';

    tmpT(:,k)= T(:,k) .* sqrt(up ./ low);

    % update V
    up = T(:,k)' * upS;
    low = T(:,k)'* InXf;

    tmpV(k,:)= V(k,:) .* sqrt(up ./ low);
  end

  % replace variables
  V = tmpV; T = tmpT;
  % update Xf
  Xf = T * V;
  
  exe_time = exe_time + toc;
  
  % make IS-divergence
  is = (X ./ Xf) - log( X ./ Xf ) - One;
  IS = reshape( is, I*J, 1 );
  error = norm( IS, 1 );
  
  wrt(lp,:) = [ exe_time  error ];
  
  tic;
end

endfunction
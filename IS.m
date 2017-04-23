function [ T, V ] = IS( X, itr, K )

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


Idn = ones(i,J);
% Iteration by MU
for lp=1:itr

  tmpT = T;
  tmpV = V;

  InXf = Idn ./ Xf;
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
  
end

end
function [ T, V ] = IS( X, K, iter )

% Get size
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

% Iteration
for loop=1:iter
  % create new variables
  tmpT = T;
  tmpV = V;
  % update T
  for i=1:R
    for k=1:K
      upper = 0;
      lower = 0;
      for j=1:C
        upper = upper + (X(i,j)/Xh(i,j))*(V(k,j)/Xh(i,j));
        lower = lower + V(k,j)/Xh(i,j);
      end
      nT(i,k) = T(i,k) * sqrt(upper / lower);
    end
  end
  % update V
  for k=1:K
    for j=1:C
      upper = 0;
      lower = 0;
      for i=1:R
        upper = upper + (X(i,j)/Xh(i,j))*(T(i,k)/Xh(i,j));
        lower = lower + T(i,k)/Xh(i,j);
      end
      nV(k,j) = V(k,j) * sqrt(upper / lower);
    end
  end
  % replace current variables to new ones
  V = nV; T = nT;
  % update \hat{X}
  Xh = T * V;
  
end

end
function [ T, V ] = IS( X, K, itr )

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
  % update T
  for i=1:I
    for k=1:K
      up = 0;
      low = 0;
      for j=1:J
        up = up + (X(i,j)/Xf(i,j))*(V(k,j)/Xf(i,j));
        low = low + V(k,j)/Xf(i,j);
      end
      tmpT(i,k) = T(i,k) * sqrt(up / low);
    end
  end
  
  % update V
  for k=1:K
    for j=1:J
      up = 0;
      low = 0;
      for i=1:I
        up = up + (X(i,j)/Xf(i,j))*(T(i,k)/Xf(i,j));
        low = low + T(i,k)/Xf(i,j);
      end
      tmpV(k,j) = V(k,j) * sqrt(up / low);
    end
  end
  % replace variables
  V = tmpV; T = tmpT;
  % update Xf
  Xf = T * V;
  
end

end
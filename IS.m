function [ T, V ] = IS( X, K, iter )

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
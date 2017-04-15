clear
%make random data
X = rand( I, J )
% Get size
[I,J] = size( X );

% initialization
T = rand( I, K );
V = rand( K, J );

% Scale Fitting
Xh = T * V;
upper = 0;
lower = 0;
for i=1:I
  for j=1:J
    upper = upper + ( X(i,j) * Xh(i,j) );
    lower = lower + ( Xh(i,j) * Xh(i,j) );
  end
end
coef = sqrt( upper / lower );
T = T * coef;
V = V * coef;
Xh = Xh * coef * coef;

[T,V] = EU();
[T,V] = KL();
[T,V] = IS();
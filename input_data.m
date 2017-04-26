% make random non-negative observation matrix
A =abs(randn( I, K ));
B =abs(randn( K, J ));

X = A * B;
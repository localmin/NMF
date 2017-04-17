clear

% parameter setting
I = 18; J = 20; % size of observation matrix
K = 4; % number of basis vectors
itr = 200; % iteration numbers

% make random non-negative observation matrix
X = rand( I, J );

sd = rand;

% Euclid distance criterion
rand( 'seed', sd ); % reset random seed for initialize T & V
[Te,Ve] = EU( X, itr, K );
 % KL-divergence criteirion
rand( 'seed', sd ); 
[Tk,Vk] = KL( X, itr, K );
% IS-divergence criteirion
rand( 'seed', sd );
[Ti,Vi] = IS( X, itr, K );
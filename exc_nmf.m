clear

parameter_setting;
I = 18; J = 30; % size of observation matrix
K = 4; % number of basis vectors
itr = 200; % iteration numbers

% make random non-negative observation matrix
X = rand( I, K ) * rand ( K, J );

sd = rand;

% Euclid distance criterion
rand( 'seed', sd ); % reset random seed for initialize T & V
[wrt_EU,Te,Ve] = EU( X, itr, K );
 % KL-divergence criteirion
rand( 'seed', sd ); 
[wrt_KL,Tk,Vk] = KL( X, itr, K );
% IS-divergence criteirion
rand( 'seed', sd );
[wrt_IS,Ti,Vi] = IS( X, itr, K );

% make graph error wrt time 
make_wrt_grph;
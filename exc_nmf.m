clear

parameter_setting;

input_data;

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
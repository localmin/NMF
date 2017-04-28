clear

parameter_setting;

input_data;

sd = rand;

% Euclid distance criterion
randn( 'seed', sd ); % reset random seed for initialize T & V
[wrt_EU,Te,Ve] = EU( X, itr, K );
 % KL-divergence criteirion
randn( 'seed', sd ); 
[wrt_KL,Tk,Vk] = KL( X, itr, K );
% IS-divergence criteirion
randn( 'seed', sd );
[wrt_IS,Ti,Vi] = IS( X, itr, K );

% make graph error wrt time 
view_result;
% plot error wrt time graphs
% Eu
figure(1)
plot( wrt_EU(:,1), wrt_EU(:,2), '-r', wrt_GCD(:,1), wrt_GCD(:,2), '-g');
title('evaluate speed of algorithms on EU');
xlabel('Time[s]');
ylabel('EU-distance');
legend( 'MU', 'GCD' );

% KL  
figure(2)
plot( wrt_KL(:,1), wrt_KL(:,2), '-r');
title('evaluate speed of algorithms on KL');
xlabel('Time[s]');
ylabel('KL-divergence');
legend( 'MU' );
  
% IS
figure(3)
plot( wrt_IS(:,1), wrt_IS(:,2), '-g');
title('evaluate speed of algorithms on IS');
xlabel('Time[s]');
ylabel('IS-divergence');
legend( 'MU' );

% view last values of cost functions
%{
printf( "last value[EU] = %f\n", wrt_EU(itr,2) );
printf( "last value[GCD] = %f\n", wrt_GCD(itr,2) );
printf( "last value[KL] = %f\n", wrt_KL(itr,2) );
printf( "last value[IS] = %f\n", wrt_IS(itr,2) );
%}
% view last values of relative error
vec_X = reshape( X, I*J, 1 );

Xf_EU = Te * Ve;
Xf_GCD = Tg * Vg;
Xf_KL = Tk * Vk;
Xf_IS = Ti * Vi;

xf_eu = reshape( Xf_EU, I*J, 1 );
xf_gcd = reshape( Xf_GCD, I*J, 1 );
xf_kl = reshape( Xf_KL, I*J, 1 );
xf_is = reshape( Xf_IS, I*J, 1 );

RE_EU = (xf_eu - vec_X)' * (xf_eu - vec_X ) / (vec_X' *vec_X ); 
RE_GCD = (xf_gcd - vec_X)' * (xf_gcd - vec_X ) / (vec_X' *vec_X ); 
RE_KL = (xf_kl - vec_X)' * (xf_kl - vec_X ) / (vec_X' *vec_X );
RE_IS = (xf_is - vec_X)' * (xf_is - vec_X ) / (vec_X' *vec_X ); 

%{
printf( "Relative_error[EU] = %f\n", RE_EU );
printf( "Relative_error[GCD] = %f\n", RE_GCD );
printf( "Relative_error[KL] = %f\n", RE_KL );
printf( "Relative_error[IS] = %f\n", RE_IS );
%}
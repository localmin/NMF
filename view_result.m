
figure(1)
plot( wrt_EU(:,1), wrt_EU(:,2), '-r');
title('evaluate speed of algorithms on EU');
xlabel('Time[s]');
ylabel('EU-distance');
legend( 'MU' );
  
figure(2)
plot( wrt_KL(:,1), wrt_KL(:,2), '-r');
title('evaluate speed of algorithms on KL');
xlabel('Time[s]');
ylabel('KL-divergence');
legend( 'MU' );
  
figure(3)
plot( wrt_IS(:,1), wrt_IS(:,2), '-r');
title('evaluate speed of algorithms on IS');
xlabel('Time[s]');
ylabel('IS-divergence');
legend( 'MU' );

printf( "last value[EU] = %f\n", wrt_EU(itr,2) );
printf( "last value[KL] = %f\n", wrt_KL(itr,2) );
printf( "last value[IS] = %f\n", wrt_IS(itr,2) );
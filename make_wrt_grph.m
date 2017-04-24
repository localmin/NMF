function [ EU, KL, IS ] = make_wrt_grph ( wrt_EU, wrt_KL, wrt_IS )

figure(1)
EU = plot( wrt_EU(:,1), wrt_EU(:,2), '-r');
title('evaluate speed of algorithms on EU');
xlabel('Time');
ylabel('EU-distance');
legend( 'MU' );
  
figure(2)
KL = plot( wrt_KL(:,1), wrt_KL(:,2), '-r');
title('evaluate speed of algorithms on KL');
xlabel('Time');
ylabel('KL-divergence');
legend( 'MU' );
  
figure(3)
IS = plot( wrt_IS(:,1), wrt_IS(:,2), '-r');
title('evaluate speed of algorithms on IS');
xlabel('Time');
ylabel('IS-divergence');
legend( 'MU' );
  

end
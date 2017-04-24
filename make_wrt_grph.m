function [ U ] = make_wrt_grph ( wrt_EU )

EU = plot( wrt_EU(:,1), wrt_EU(:,2), '-r');
title('evaluate speed of algorithms on EU');
xlabel('Time');
ylabel('EU');
legend( 'MU' );
  

%{
KL = plot( wrt_KL(:,1), wrt_KL(:,2), '-ro');
title('evaluate speed of algorithms on KL');
xlabel('Time');
ylabel('KL');
legend( 'MU' );
  
IS = plot( wrt_IS(:,1), wrt_IS(:,2), '-ro');
title('evaluate speed of algorithms on IS');
xlabel('Time');
ylabel('IS');
legend( 'MU' );
  
%}

end

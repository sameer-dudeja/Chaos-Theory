rStart = 0;
rEnd = 4;
rStep = 0.01;
LE = LEofLogisticMap( rStart, rEnd, rStep );
figure; plot( rStart:rStep:rEnd, LE, 'k.-' ); axis tight;
title('Values of estimated Lyapunov exponent for logistic map for r = 3.5...4' );
xlabel( 'r' );
ylabel( 'Values of estimated Lyapunov exponent' );
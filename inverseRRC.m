


function reconstrSignal=inverseRRC(filtSignal, sFreq)

% filtSignal - signal after hardware RRC filter

% sFreq - sampling frequency in Hz

T=1/sFreq; % inter-sampling interval

% R C Rc - nominal filter values (real values may differ by a few percent)

R = 1; % MOhm
C = 1; % uF 
Rc = 10; % MOhm

% a and b calculated from the circuit diagram of the filter

a = [ R*T+2*C*R*Rc,      R*T-2*C*R*Rc];
b = [ (Rc+R)*T+2*C*R*Rc, (Rc+R)*T-2*C*R*Rc];

reconstrSignal = filter(b, a, filtSignal);

end

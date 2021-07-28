



function reconstrSignal=IFtheor(filtSignal, sFreq)

% filtSignal - signal after harware RRC filter

% sFreq - sampling frequency in Hz

T=1/sFreq; % inter-sampling interval

% R C Rc - nominal filter values (real values may differ by a few percent)

R = 1; % MOhm
C = 1; % uF 
Rc = 10; % MOhm

% a and b depending on the nominal values ??of the elements

% a = [ R*T+2*C*R*Rc,      R*T-2*C*R*Rc];
% b = [ (Rc+R)*T+2*C*R*Rc, (Rc+R)*T-2*C*R*Rc];

ko=R/(R+Rc);
tau=C*Rc;

% a and b depending on the tau and k0

b=[(T+2*ko*tau), (T-2*ko*tau)];
a=[(T*ko+2*ko*tau); (T*ko-2*ko*tau)];

reconstrSignal = filter(b, a, filtSignal);

end
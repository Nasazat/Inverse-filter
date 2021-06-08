

function reconstrSignal=inverseRRC_indirect(filtSignal, sFreq)

% filtSignal - signal after harware RRC filter

% sFreq - sampling frequency in Hz

T=1/sFreq; % inter-sampling interval

% Examples for measured k0 and tau values

ko=0.09175135569585634; 
tau=10.268060290990753;

% a and b calculated from the circuit diagram of the filter

b=[(T+2*ko*tau), (T-2*ko*tau)];
a=[(T*ko+2*ko*tau); (T*ko-2*ko*tau)];

reconstrSignal = filter(b, a, filtSignal);

end


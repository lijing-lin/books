% Invariant impulse transformation from analog filter to digital filter
%Analog filter (wc= 63rad/s = 10Hz.):
num=[63]; % transfer function numerator;
den=[1 63]; %transfer function denominator
%Digital filter
fs=100; %sampling frequency in Hz.
[numd,dend]= impinvar(num,den,fs); %invariant impulse transformation
f=logspace(-1,2); %logaritmic set of frequency values in Hz.
G=freqz(numd,dend,f,fs); %computes frequency response
AG=20*log10(abs(G)); %take decibels
FI=angle(G); %take phases (rad)
subplot(2,1,1); semilogx(f,AG,'k'); %plots decibels
grid;axis([1 100 -10 5]);
ylabel('dB'); title('frequency response for impulse invariance method')
subplot(2,1,2); semilogx(f,FI,'k'); %plots phases
grid; axis([1 100 -1 1]);
ylabel('rad.'); xlabel('Hz.')

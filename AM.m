clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

#... Message signal
am = 1; #... Amplitude of message signal
fm = 10; #... Frequency(Hz) of message signal
t = 0:0.001:1; #... Time
message_signal = am*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t, message_signal);
title('Message Signal');

#... Carrier signal
ac = 2; #... Amplitude of carrier signal
fc = 100; #... Frequency(Hz) of carrier signal
carrier_signal = ac*sin(2*pi*fc*t);
subplot(4,1,2);
plot(t, carrier_signal);
title('Carrier Signal');

#... Modulation
k = am/ac; #... Amplitude sensitivity
modulated_signal = (1+k*message_signal).*carrier_signal;
subplot(4,1,3);
plot(t, modulated_signal);
title('Modulated Signal');

#... From YouTube: demodulated_signal = (1/pi)*(ac*message_signal);
#... Demodulation: my formula
demodulated_signal = (modulated_signal./carrier_signal)-1;
subplot(4,1,4);
plot(t, demodulated_signal);
title('Demodulated Signal');

clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

#... Modulation

msg_amplitude = 5;
msg_frequency = 5;
time = 00:0.001:5;
msg_signal = msg_amplitude*sin(2*pi*msg_frequency*time);
subplot(4,1,1);
plot(time, msg_signal);
title('Modulating or Message Signal');

carrier_amplitude = 10;
carrier_frequency = 50;
carrier_signal = carrier_amplitude*sin(2*pi*carrier_frequency*time);
subplot(4,1,2);
plot(time, carrier_signal);
title('Carrier Signal');

modulated_signal = (msg_signal+1).*carrier_signal;
subplot(4,1,3);
plot(time, modulated_signal);
title('Modulated Signal');

#... Demodulation

demodulated_signal = abs(hilbert(modulated_signal)).*cos(2*pi*carrier_frequency*time);
subplot(4,1,4);
plot(time, demodulated_signal);
title('Demodulated Signal');

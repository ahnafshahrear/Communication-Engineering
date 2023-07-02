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

#... Demodulation

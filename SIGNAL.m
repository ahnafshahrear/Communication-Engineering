clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

#... Analog signal
f = 5; #... Frequency(Hz)
a = 12; #... Amplidude
time = 0:0.01:1; #... Continuous time
analog_signal = a*sin(2*pi*f*time);
subplot(3, 1, 1);
plot(time, analog_signal);
title("Analog Signal");

#... Digital signal
fs = 50; #... Sampling frequency(HZ)
n = 0:1/fs:1; #... Samples
digital_signal = a*sin(2*pi*f*n);
subplot(3, 1, 2);
stem(n, digital_signal, ".");
title("Digital Signal");

#... Composite signal
t = 0:0.01:2;
x = 5*sin(2*pi*7*t)+7*cos(2*pi*4*t);
subplot(3, 1, 3);
plot(t, x);
title("Composite Signal");

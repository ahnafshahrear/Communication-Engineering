clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

bits = [1 0 1 1 0 0 1]; #... Bitstream

#... Modulation

bitrate = 1; #... Number of bits per second

sampling_rate = 100;
sampling_time = 1/sampling_rate;

end_time = length(bits)/bitrate;
time = 0:sampling_time:end_time;

signal_one = 3*sin(2*pi*4*time);
modulation = 3*sin(2*pi*2*time);

in = 1; #... Bitstream index

for i = 1:length(time)
    if bits(in) == 1
        modulation(i) = signal_one(i);
    endif
    if time(i)*bitrate >= in
        in = in+1;
    endif
endfor

plot(time, modulation, "LineWidth", 1);
axis([0 end_time -12 12]);
grid on;

#... Demodulation

in = 1;

for i = 1:length(modulation)
    demodultaion(in) = 1;
    if modulation(i) != signal_one(i)
        demodultaion(in) = 0;
    endif
    if time(i)*bitrate >= in
        in = in+1;
    endif
endfor

disp(demodultaion);

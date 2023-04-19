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

a = 3; #... Amplitude
f = 2; #... Frequency
modulation = a*sin(2*pi*f*time);

bit = 1; #... Bitstream index

for i = 1:length(time)
    if bits(bit) == 0
        modulation(i) = 0;
    endif
    if time(i)*bitrate >= bit
        bit = bit+1;
    endif
endfor

plot(time, modulation, "LineWidth", 1);
axis([0 end_time -a-4 a+4]);
grid on;

#... Demodulation

bit = 1;

for i = 1:length(modulation)
    if modulation(i) != 0
        demodultaion(bit) = 1;
    else
        demodultaion(bit) = 0;
    endif
    if time(i)*bitrate >= bit
        bit = bit+1;
    endif
endfor

disp(demodultaion);

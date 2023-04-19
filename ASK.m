clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

bits = [1 0 1 1 0 0 1];

#... Modulation

bitrate = 1; #... Number of bits per second

sampling_rate = 100;
sampling_time = 1/sampling_rate;

end_time = length(bits)/bitrate;
time = 0:sampling_time:end_time;

a = 3;
f = 2;
modulation = a*sin(2*pi*f*time);

index = 1;

for i = 1:length(time)
    if bits(index) == 0
        modulation(i) = 0;
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor

plot(time, modulation, "LineWidth", 1);
axis([0 end_time -5 +5]);
grid on;

#... Demodulation

index = 1;

for i = 1:length(modulation)
    if modulation(i) != 0
        demodultaion(index) = 1;
    else
        demodultaion(index) = 0;
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor

disp(demodultaion);

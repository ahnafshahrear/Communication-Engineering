clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

bits = [1,0,1,1,0,1,0,1,1,0,0,1,0];

#... Modulation

bitrate = 1; #... Number of bits per second
voltage = 5;

samplingRate = 1000;
samplingTime = 1/samplingRate;

endTime = length(bits)/bitrate;
time = 0:samplingTime:endTime;

index = 1;

for i = 1:length(time)
    if bits(index) == 1 && time(i)*bitrate < index-1/2
        modulation(i) = -voltage;
    endif
    if bits(index) == 1 && time(i)*bitrate >= index-1/2
        modulation(i) = voltage;
    endif
    if bits(index) == 0 && time(i)*bitrate < index-1/2
        modulation(i) = voltage;
    endif
    if bits(index) == 0 && time(i)*bitrate >= index-1/2
        modulation(i) = -voltage;
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor

plot(time, modulation, "LineWidth", 1);
axis([0 endTime -voltage-5 voltage+5]);
grid on;

#... Demodulation

index = 1

for i = 1:length(modulation)
    if modulation(i) == -voltage && time(i)*bitrate < index-1/2
        demodultaion(index) = 1;
    endif
    if modulation(i) == voltage && time(i)*bitrate < index-1/2
        demodultaion(index) = 0;
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor

disp(demodultaion);

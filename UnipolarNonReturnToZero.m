clc;
clear all;
close all;

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
    if bits(index) == 1
        modulation(i) = voltage;
    else
        modulation(i) = 0;
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor

plot(time, modulation);
axis([0 endTime -5 voltage+5]);

#... Demodulation

index = 1

for i = 1:length(modulation)
    if modulation(i) == voltage
        demodultaion(index) = 1;
    else
        demodultaion(index) = 0;
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor

disp(demodultaion);

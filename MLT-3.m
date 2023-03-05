clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

bits = [1 0 1 1 0 0 1];

#... Modulation

bitrate = 1; #... Number of bits per second
voltage = 5;

samplingRate = 1000;
samplingTime = 1/samplingRate;

endTime = length(bits)/bitrate;
time = 0:samplingTime:endTime;

index = 1;
sign = 1;
last = 1;
if bits(1) == 1
    sign = 0;
endif

for i = 1:length(time)
    modulation(i) = sign*voltage;
    if time(i)*bitrate >= index
        if sign != 0
            last = sign;
        endif
        index = index+1;
        if index <= length(bits) && bits(index) == 1
            if sign == 0
                sign = -last;
            else
                sign = 0;
            endif
        endif
    endif
endfor

plot(time, modulation, "LineWidth", 1);
axis([0 endTime -voltage-5 voltage+5]);
grid on;

#... Demodulation

index = 1
last = voltage;

for i = 1:length(modulation)
    if modulation(i) == last
        demodultaion(index) = 0;
    else
        demodultaion(index) = 1;
    endif
    if time(i)*bitrate >= index
        index = index+1;
        last = modulation(i);
    endif
endfor

disp(demodultaion);

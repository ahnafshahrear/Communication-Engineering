clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

bits = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];

#... Modulation

count = 0;
for i = 1:length(bits)
    if bits(i) == 0
        count = count+1;
    else
        count = 0;
    endif
    if count == 8
        bits(i-4) = -1;
        bits(i-3) = 1;
        bits(i-1) = -1;
        bits(i) = 1;
        count = 0;
    endif
endfor

bitrate = 1; #... Number of bits per second
voltage = 5;

samplingRate = 1000;
samplingTime = 1/samplingRate;

endTime = length(bits)/bitrate;
time = 0:samplingTime:endTime;

index = 1;
sign = -1;

for i = 1:length(time)
    if bits(index) != 0
        modulation(i) = sign*voltage;
    else
        modulation(i) = 0;
    endif
    if time(i)*bitrate >= index
        index = index+1;
        if index <= length(bits) && bits(index) != 0
            sign = -1*sign*bits(index);
        endif
    endif
endfor

plot(time, modulation, "LineWidth", 1);
axis([0 endTime -voltage-5 voltage+5]);
grid on;

#... Demodulation

index = 1;

for i = 1:length(modulation)
    if modulation(i) != 0
        demodulation(index) = modulation(i)/voltage;
    else
        demodulation(index) = 0;
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor

last = 1;
for i = 1:length(demodulation)
    if demodulation(i) != 0
        if (demodulation(i) == last) #... Means violation occured
            demodulation(i) = 0;
            demodulation(i+1) = 0;
            demodulation(i+3) = 0;
            last = demodulation(i+4);
            demodulation(i+4) = 0;
        else
            last = demodulation(i);
        endif
    endif
endfor

for i = 1:length(demodulation)
    if demodulation(i) != 0
        demodulation(i) = 1;
    endif
endfor

disp(demodulation);

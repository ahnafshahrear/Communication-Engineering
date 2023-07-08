clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

bits = [1 0 0 0 0 0 0 0 0 1 0 1];

#... Modulation
bitrate = 1;
voltage = 5;

sampling_rate = 1000;
sampling_time = 1/sampling_rate;

end_time = length(bits)/bitrate;
time = 0:sampling_time:end_time;

count = 0;
for i = 1:length(bits)
  if bits(i) == 0
    count = count+1;
  else
    count = 0;
  endif
  if count == 8
    bits(i-4) = -1;
    bits(i-3) = -1;
    bits(i-1) = 1;
    bits(i) = 1;
    count = 0;
  endif
endfor

disp(bits);

index = 1;
sign = -1;

for i = 1:length(time)
  modulation(i) = bits(index)*sign*voltage;
  if time(i)*bitrate >= index
        index = index+1;
        if index <= length(bits) && bits(index) != 0
            sign = -sign;
        endif
    endif
endfor

plot(time, modulation);
axis([0 end_time -voltage-5 voltage+5]);
line([0 end_time], [0,0]);
grid on;

#... Demodulation
index = 1;

for i = 1:length(modulation)
  demodulation(index) = modulation(i)/voltage;
  if time(i)*bitrate >= index
    index = index+1;
  endif
endif

for i = 1:length(demodulation)
  if demodulation(i) == -1
    for j = 0:7
      demodulation(i+j) = 0;
    endfor
  endif
endif

disp(demodulation);

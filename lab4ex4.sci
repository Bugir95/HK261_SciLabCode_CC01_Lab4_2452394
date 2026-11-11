clc;
clear;
close;

[y, Fs, bits] = wavread("input.wav");

disp("Original audio information:");
disp("Sampling frequency:");
disp(Fs);
disp("Audio dimensions:");
disp(size(y));
disp("Original maximum amplitude:");
disp(max(abs(y)));

if size(y, 1) == 1 then
    y = y';
end

if size(y, 2) > 1 then
    y = mean(y, 2);
end

N = size(y, 1);
t = (0:N-1)' / Fs;

gain = 0.5;
y_processed = gain * y;

disp("Processed audio information:");
disp("Number of samples:");
disp(N);
disp("Processed maximum amplitude:");
disp(max(abs(y_processed)));

scf(1);

subplot(2, 1, 1);
plot(t, y);
xtitle("Original Audio Signal", "Time (s)", "Amplitude");
xgrid();

subplot(2, 1, 2);
plot(t, y_processed);
xtitle("Processed Audio Signal - Reduced Amplitude", "Time (s)", "Amplitude");
xgrid();

playsnd(y_processed, Fs);

wavwrite(y_processed, Fs, bits, "processed_audio.wav");

disp("Audio processing completed.");
disp("Output saved as processed_audio.wav");

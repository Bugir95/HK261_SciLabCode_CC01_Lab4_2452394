clc;
clear;
close;

x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];

N = length(x);
n = 0:N-1;

y_fold = zeros(1, N);

for i = 0:N-1
    for k = 0:N-1
        index = modulo(i-k, N) + 1;
        y_fold(i+1) = y_fold(i+1) + h(k+1)*x(index);
    end
end

H = zeros(N, N);

for i = 0:N-1
    for j = 0:N-1
        index = modulo(i-j, N) + 1;
        H(i+1, j+1) = h(index);
    end
end

y_matrix = H * x';

Ex = sum(abs(x).^2);
Ey = sum(abs(y_fold).^2);

disp("Folding and shifting result:");
disp(y_fold);

disp("Circular convolution matrix:");
disp(H);

disp("Matrix method result:");
disp(y_matrix');

disp("Input signal energy:");
disp(Ex);

disp("Output signal energy:");
disp(Ey);

scf(1);

subplot(2, 2, 1);
plot2d3(n, x, style=2);
xtitle("Input Signal x(n)", "n", "Amplitude");
xgrid();

subplot(2, 2, 2);
plot2d3(n, y_fold, style=3);
xtitle("Circular Convolution y(n)", "n", "Amplitude");
xgrid();

subplot(2, 2, 3);
plot2d3(n, abs(x).^2, style=4);
xtitle("Input Signal Energy", "n", "Energy");
xgrid();

subplot(2, 2, 4);
plot2d3(n, abs(y_fold).^2, style=5);
xtitle("Output Signal Energy", "n", "Energy");
xgrid();

clc;
clear;
close;

x = [1 2 -3 2 1];
h = [1 0 -1];

Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;

n = 0:Ny-1;

y_fold = zeros(1, Ny);

for i = 0:Ny-1
    for k = 0:Nh-1
        if (i-k >= 0) & (i-k < Nx) then
            y_fold(i+1) = y_fold(i+1) ...
                + h(k+1)*x(i-k+1);
        end
    end
end

H = zeros(Ny, Nx);

for i = 1:Ny
    for j = 1:Nx
        k = i-j;
        if (k >= 0) & (k < Nh) then
            H(i,j) = h(k+1);
        end
    end
end

y_matrix = H*x';

disp("Folding and shifting result:");
disp(y_fold);

disp("Convolution matrix:");
disp(H);

disp("Matrix method result:");
disp(y_matrix');

Ex = sum(abs(x).^2);
Ey = sum(abs(y_fold).^2);

disp("Input signal energy:");
disp(Ex);

disp("Output signal energy:");
disp(Ey);

energy_x = abs(x).^2;
energy_y = abs(y_fold).^2;

scf(1);

subplot(3,1,1);
plot2d3(0:Nx-1, x);
xtitle("Input Signal x(n)", "n", "Amplitude");
xgrid();

subplot(3,1,2);
plot2d3(n, y_fold);
xtitle("Output Signal y(n)", "n", "Amplitude");
xgrid();

subplot(3,1,3);
plot2d3(0:Nx-1, energy_x);
plot2d3(n, energy_y);
xtitle("Energy Distribution of x(n) and y(n)", "n", "Energy");
legend(["|x(n)|^2"; "|y(n)|^2"]);
xgrid();

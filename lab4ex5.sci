clc;
clear;
close;

img = imread("input.png");

if size(img, 3) == 3 then
    gray = rgb2gray(img);
else
    gray = img;
end

gray_double = double(gray);

min_val = min(gray_double(:));
max_val = max(gray_double(:));

if max_val > min_val then
    processed = uint8(255 * ...
        (gray_double - min_val) / (max_val - min_val));
else
    processed = uint8(gray_double);
end

scf(1);
imshow(gray);
xtitle("Original Grayscale Image");

scf(2);
imshow(processed);
xtitle("Contrast Enhanced Image");

[hist_original, bins_original] = imhist(gray);
[hist_processed, bins_processed] = imhist(processed);

scf(3);
subplot(2, 1, 1);
plot(0:255, hist_original');
xtitle("Original Image Histogram", "Pixel Intensity", "Frequency");
xgrid();

subplot(2, 1, 2);
plot(0:255, hist_processed');
xtitle("Processed Image Histogram", "Pixel Intensity", "Frequency");
xgrid();

imwrite(processed, "processed_image.png");

disp("Image processing completed.");
disp("Output saved as processed_image.png");

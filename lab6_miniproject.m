%% Lab 6: Mini Project – Integrated Image Processing
close all; clear; clc;

% 1) Load your own image (object, face, landscape, etc.)
I = im2double(rgb2gray(imread('project_image.jpg')));

% 2) Pre-process: noise removal (median filter)
I_filt = medfilt2(I,[3 3]);

% 3) Enhance contrast (stretch intensity range)
I_enh = imadjust(I_filt,[0.2 0.8],[0 1]);

% 4) Extract features (Canny edge detector)
edges = edge(I_enh,'Canny',[0.1 0.25]);

% 5) Apply low-pass filter in frequency domain
F = fftshift(fft2(I_enh));
[M,N] = size(F);
[u,v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
H = double(sqrt(u.^2 + v.^2) < 60);   % circular LPF
I_lp = real(ifft2(ifftshift(F .* H)));

% 6) Visualization
figure; 
montage({I, I_filt, I_enh, edges, I_lp}, 'Size', [1 5]);
title('Original | Denoised | Enhanced | Edges | LP result');


%% ---------------- LAB 6 REPORT ----------------
% Goal:
% The goal of this mini-project was to design a complete DSP-based image
% processing pipeline using spatial filtering, enhancement, edge detection,
% and frequency-domain filtering in one workflow.

% Pipeline Summary:
% 1) Image converted to grayscale for intensity-based operations.
% 2) Median filter removed salt-and-pepper noise (non-linear spatial filter).
% 3) imadjust improved contrast by stretching histogram values.
% 4) Canny detector extracted clean edges using gradient + thresholding.
% 5) Low-pass mask applied in FFT domain to smooth high-frequency content.

% DSP Concepts:
% - Median filter = spatial noise reduction.
% - Contrast adjustment = point-wise intensity transform.
% - Canny = gradient + hysteresis + Gaussian smoothing.
% - FFT + mask = frequency-domain filtering.

% Observations:
% - Median filter reduced noise without blurring edges.
% - Contrast enhancement made edges more visible and sharp.
% - Canny produced thin, well-detected edges.
% - LPF output is smoother but with lost fine details.

% Limitations:
% - Thresholds for Canny were selected manually.
% - Low-pass cutoff is fixed, not adaptive.
% - Pipeline works well on this image but may need tuning for others.

% Conclusion:
% The final workflow successfully demonstrates how spatial and frequency
% techniques can be combined for image enhancement and feature extraction.
% Future improvements could include adaptive filtering or segmentation.

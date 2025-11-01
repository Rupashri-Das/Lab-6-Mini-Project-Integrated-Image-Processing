# Lab 6 – Mini Project: Integrated Image Processing

### Overview
This mini project combines key digital signal and image processing concepts such as filtering, enhancement, edge detection, and frequency-domain analysis into a single image pipeline.

### Steps Performed
1. **Image Loading and Resizing**  
   The input image (`project_image.jpg`) is converted to grayscale and resized to 512×512 for consistent processing in MATLAB Online.

2. **Noise Removal**  
   A median filter is applied to remove small-scale noise while preserving edges.

3. **Contrast Enhancement**  
   The `imadjust` function enhances image contrast to improve the visibility of details and edges.

4. **Edge Detection**  
   The Canny operator extracts strong and clean edges, highlighting the structure of the object in the image.

5. **Frequency-Domain Filtering**  
   The image undergoes a low-pass filtering process using the Fourier transform, which smooths the image by reducing high-frequency details.

6. **Visualization**  
   A montage displays all stages: original, denoised, enhanced, edges, and low-pass filtered results.

### Discussion
This pipeline demonstrates how DSP-based operations can be combined to improve image quality and extract features effectively. The median filter reduces random noise, contrast enhancement makes edges more prominent, and Canny detection provides clear boundaries. The low-pass filtering smooths textures, showing how frequency-domain operations complement spatial filtering.

### MATLAB Details
- **MATLAB Version:** MATLAB Online (R2025a)  
- **Student:** Rupashri Das  
- **Date:** 01 November 2025


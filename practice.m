subplot(3,1,1);
imshow(imgavf,map);
xlabel('Original Image after Average Filtering');
imgavfn = mask_filter(imgn,m);
subplot(3,1,2);
imshow(imgavfn,map);
xlabel('Image  + Gaussian Noise after Average Filtering');
subplot(3,1,3);
post_nse = imgavfn - imgavf;
imshow(abs(post_nse),map);
xlabel('Gaussian Noise after Average Filtering');

function [t_img,pct] = threshold(image, level, history, lo)

if (nargin ==2) hi = max(max(image)); lo = 1; end;
if (nargin == 3) lo = 1; end;

[r,c] = size(image);
tot=0; 
des=0;
t_img = image;

for i = 1:r;
    for j = 1:c;
        if 
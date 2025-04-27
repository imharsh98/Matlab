subplot(3,1,1);
imshow(imgo,map);
xlabel('Original Image');
subplot(3,1,2);
imshow(imgn,map);
xlabel('Original Image + Gaussian Noise');
subplot(3,1,3);
pre_nse = imgn - imgo;
imshow(abs(pre_nse),map);
xlabel('Gaussian Noise Before Filtering');


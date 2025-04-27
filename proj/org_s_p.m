subplot(3,1,1);
imshow(imgo,map);
xlabel('Original Image');
subplot(3,1,2);
imshow(imgs,map);
xlabel('Original Image + Salt & Pepper Noise');
subplot(3,1,3);
pre_nse_s = imgs - imgo;
imshow(abs(pre_nse_s),map);
xlabel('Salt & Pepper Noise Before Filtering');


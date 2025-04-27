subplot(3,1,1);
imshow(imgavf,map);
xlabel('Original Image After Average Filtering');
imgavfs = mask_filter(imgs,m);
subplot(3,1,2);
imshow(imgavfs,map);
xlabel('Image + Salt & Pepper Noise After Average Filtering');
subplot(3,1,3);
post_nse_s = imgavfs - imgavf;
imshow(abs(post_nse_s),map);
xlabel('Salt & Pepper Noise After Average Filtering');


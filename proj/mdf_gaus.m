subplot(3,1,1);
imshow(imgmdf,map);
xlabel('Original Image After Median Filtering');
imgmdfn = median_filter(imgn);
subplot(3,1,2);
imshow(imgmdfn,map);
xlabel('Image + Gaussian Noise After Median Filtering');
subplot(3,1,3);
post_nse_m = imgmdfn - imgmdf;
imshow(abs(post_nse_m),map);
xlabel('Gaussian Noise After Median Filtering');


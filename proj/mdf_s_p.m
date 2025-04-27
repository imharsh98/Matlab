subplot(3,1,1);
imshow(imgmdf,map);
xlabel('Original Image After Median Filtering');
imgmdfs = median_filter(imgs);
subplot(3,1,2);
imshow(imgmdfs,map);
xlabel('Image + Salt & Pepper Noise After Median Filtering');
subplot(3,1,3);
post_nse_sm = imgmdfs - imgmdf;
imshow(abs(post_nse_sm),map);
xlabel('Salt & Pepper Noise After Median Filtering');


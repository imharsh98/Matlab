subplot(3,1,1);
imshow(imgavf,map);
xlabel('Original Image After Average Filtering');
imgavfn = mask_filter(imgn,m);
subplot(3,1,2);
imshow(imgavfn,map);
xlabel('Image + Gaussian Noise After Average Filtering');
subplot(3,1,3);
post_nse = imgavfn - imgavf;
imshow(abs(post_nse),map);
xlabel('Gaussian Noise After Average Filtering');


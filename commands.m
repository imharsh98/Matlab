[imgo,map]=imread('orig.bmp');
figure(1);
subplot(3,1,1);
imshow(imgo,map);
xlabel('Original Image');

[imgn,map]=imread('rand.bmp');
subplot(3,1,2);
imshow(imgn,map);
xlabel('Image contaminated by Random Noise');

[imgs,map]=imread('s_p.bmp');
subplot(3,1,3);
imshow(imgs,map);
xlabel('Image contaminated by Salt and Pepper Noise');

colorbar('vert');

orient tall;
print -dps2;

// question 4 answers
size(imgo)
size(map)

// part 5
mapr=map;
mapr(2:256,1)=ones(size(mapr(2:256,1)));
mapg=map;
mapg(2:256,2)=ones(size(mapr(2:256,2)));
mapb=map;
mapb(2:256,3)=ones(size(mapr(2:256,3)));

// part 6
figure(2);
subplot(1,1,1);
imshow(imgo,mapr);
xlabel('Image rendered using mapr');
colorbar('horiz');

figure(3);
imshow(imgo,mapg);
xlabel('Image rendered using mapg');
colorbar('horiz');

figure(4);
imshow(imgo,mapb);
xlabel('Image rendered using mapb');
colorbar('horiz');

//part 7
[imgt100,pct100]=threshold1(imgo,100,1,0);
[imgt175,pct175]=threshold1(imgo,175,2,0);
[imgt245,pct245]=threshold1(imgo,245,3,0);

map4 = [0, 0, 0;
        1, 0.5, 0.5;
        1, 0.2, 0.5;
        1, 0, 0 ];

figure(5);
subplot(3,1,1);
imshow(imgt100,map4);
xlabel('threshold=100');
subplot(3,1,2);
imshow(imgt175,map4);
xlabel('threshold=175');
subplot(3,1,3);
imshow(imgt245,map4);
xlabel('threshold=245');
colorbar('vert');

pct100
pct175
pct245

figure(6);
h_gram(imgo,2,255);
title('Pixel Value Histogram for Original Image');

//part 8
imgtcmb = max(imgt100,imgt175);
imgtcmb = max(imgtcmb,imgt245);
figure(7);
subplot(1,1,1);
imshow(imgtcmb,map4);
xlabel('thresholds combined');
colorbar('horiz');

//part 9
imgtbin = min(1,imgt175);
imgtbin = double(imgtbin);

mhz = [-1,-2,-1;0,0,0;1,2,1];
mvl = [-1,0,1;-2,0,2;-1,0,1];
mlp = [0,1,0;1,-4,1;0,1,0];

imghzf = 9 * mask_filter(imgtbin,mhz);
imgvlf = 9 * mask_filter(imgtbin,mvl);
imglpf = 9 * mask_filter(imgtbin,mlp);

imghzf = 2 + min(1,max(-1,imghzf));
imgvlf = 2 + min(1,max(-1,imgvlf));
imglpf = 2 + min(1,max(-1,imglpf));

map3 = [1,1,0;0,0,0;1,1,1];

figure(8);
subplot(3,1,1);
imshow(imghzf,map3);
xlabel('Horizontal Edge Detector');
subplot(3,1,2);
imshow(imgvlf,map3);
xlabel('Vertical Edge Detector');
subplot(3,1,3);
imshow(imglpf,map3);
xlabel('Laplacian filter');

imgo = double(imgo);
imgn = double(imgn);
imgs = double(imgs);

// part 10
m = [1,1,1;1,1,1;1,1,1];
imgavf = mask_filter(imgo,m);
figure(9);
subplot(3,1,1);
imshow(imgo,map);
xlabel('Original image');
subplot(3,1,2);
imshow(imgavf,map);
xlabel('Original Image After Average Filtering');

// part 11
imgmdf = median_filter(imgo);
subplot(3,1,3);
imshow(imgmdf,map);
xlabel('Original Image after Median Filtering');
colorbar('horiz');

// part 12
figure(10);
org_gaus;

figure(11);
org_s_p;

figure(12);
avf_gaus;

figure(13);
mdf_gaus;

figure(14);
avf_s_p;

figure(15);
mdf_s_p;
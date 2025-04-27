function median_image = median_filter(image)

[ri,ci] = size(image);
rm = 3; cm = 3;

if ( ri < (3*rm) | ci < (3*ri) )
	error('Image must be at least 9x9 pixels');
end;

median_image(1,1) = median(median(image(1:2,1:2)));
median_image(1,ci) = median(median(image(1:2,ci-1:ci)));
median_image(ri,1) = median(median(image(ri-1:ri,1:2)));
median_image(ri,ci) = median(median(image(ri-1:ri,ci-1:ci)));

for r = 2:ri-1;
	median_image(r,1) = median(median(image(r-1:r+1,1:2)));
	median_image(r,ci) = median(median(image(r-1:r+1,ci-1:ci)));
end;

for c = 2:ci-1;
	median_image(1,c) = median(median(image(1:2,c-1:c+1)));
	median_image(ri,c) = median(median(image(ri-1:ri,c-1:c+1)));
end;

for r = 2:ri-1;
	for c = 2:ci-1;
		median_image(r,c) = median(median(image(r-1:r+1,c-1:c+1)));
	end;
end;





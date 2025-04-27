function mask_image = mask_filter(image, mask)

[ri,ci] = size(image);
[rm,cm] = size(mask);

if ( rm ~= 3 | cm ~= 3)
	error('Mask must be a 3x3 matrix');
end;

if ( ri < (3*rm) | ci < (3*ri) )
	error('Image must be at least 3 times the size of mask');
end;

% Convolution of corner pixels with mask
mask_image(1,1) = sum(sum(image(1:2,1:2) .* mask(2:3,2:3)))/4;
mask_image(1,ci) = sum(sum(image(1:2,ci-1:ci) .* mask(1:2,2:3)))/4;
mask_image(ri,1) = sum(sum(image(ri-1:ri,1:2) .* mask(2:3,1:2)))/4;
mask_image(ri,ci) = sum(sum(image(ri-1:ri,ci-1:ci) .* mask(1:2,1:2)))/4;

% Convolution of first and last columns with mask
for r = 2:ri-1;
	mask_image(r,1) = sum(sum(image(r-1:r+1,1:2) .* mask(1:3,2:3)))/6;
	mask_image(r,ci) = sum(sum(image(r-1:r+1,ci-1:ci) .* mask(1:3,1:2)))/6;
end;

% Convolution of first and last rows with mask
for c = 2:ci-1;
	mask_image(1,c) = sum(sum(image(1:2,c-1:c+1) .* mask(2:3,1:3)))/6;
	mask_image(ri,c) = sum(sum(image(ri-1:ri,c-1:c+1) .* mask(1:2,1:3)))/6;
end;

% Convolution of rest of image with mask
for r = 2:ri-1;
	for c = 2:ci-1;
		mask_image(r,c) = sum(sum(image(r-1:r+1,c-1:c+1) .* mask(1:3,1:3)))/9;
	end;
end;


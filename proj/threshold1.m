function [t_img,pct] = threshold(image, level, hi, lo)

if (nargin == 2) hi = max(max(image)); lo = 1; end;
if (nargin == 3) lo = 1; end;

[r,c] = size(image);
tot=0;						% stores total number of non-background pixels
des=0;						% stores total number of pixels with values > threshold level
t_img = image;

for i = 1:r;							% loop for all rows
	for j = 1:c;					% loop for all columns
		if(image(i,j) ~= 0)			% if not background
			tot=tot+1;
			if (image(i,j) < level)			% if < threshold (i.e. deseased)
				des=des+1;
				t_img(i,j) = lo;
			else							% if >= threshold (i.e. healthy)
				t_img(i,j) = hi;
			end;
		end;
	end;
end;

pct = (des/tot)*100;			% calculate percentage of deseased image


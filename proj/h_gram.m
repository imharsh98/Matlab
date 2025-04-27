function h_gram(image,lo,hi)

image=single(image);
min_pt = floor(min(min(image)));
max_pt = ceil(max(max(image)));
all_bins = max_pt-min_pt+1;

if (nargin == 1) lo = min_pt; hi = max_pt; end; 

[N,X] = hist(image,all_bins);
N = N(lo:hi,:);
X = X(lo:hi);
NN = sum(N');
bar(X,NN);
axis([lo,hi,0,100*ceil(max(NN)/100)]);
xlabel('Pixel Value Histogram');



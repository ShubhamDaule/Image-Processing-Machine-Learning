function filteredim = MedianFiltering(im, mask)
[m, n] = size(mask);
if m ~= n
error('Error occured: Mask is not square matrix');
elseif mod(n,2) == 0
error('Error occured: Size of mask is even');
end
filteredim = im;
for i = 1 : size(im,1)-n+1
for j = 1 : size(im,2)-n+1
window = im(i:i+n-1, j:j+n-1);
filteredim(i,j) = median(median(double(window) .* mask));
end
end
end
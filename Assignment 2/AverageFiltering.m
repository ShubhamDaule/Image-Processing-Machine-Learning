function filteredIm= AverageFiltering(im,mask)

N=length(mask);
im=double(im);

[m,n]=size(im);
iRow=floor(N/2)+1; iCol=floor(N/2)+1;

% apply the filter to image
for iRow=floor(N/2)+1:m-(floor(N/2)+1)
for iCol=floor(N/2)+1:n-(floor(N/2)+1)
filteredIm(iRow,iCol)=sum(sum(mask.*im(iRow-floor(N/2):iRow+floor(N/2),iCol-floor(N/2):iCol+floor(N/2))));
end
end

filteredIm=uint8(filteredIm);
end
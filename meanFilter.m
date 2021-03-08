function meanImg = meanFilter(wSize, img)
% code for a mean filter

%create a window to be passed along the image.
%fills in the weights of the window - suim of weights is 1
wWeight = 1/wSize^2;

%creates a window to scan image of the desired size
window  = wWeight*ones(wSize);

%throw error if the sum of the weights is not 1
%sum is a floating point number so must be compared with a tolerance
assert(ismembertol(sum(window,'all'),1));

meanImg = convolution(wSize, window, img);
%meanImg = conv2(img, window, 'same');

%show image
imshow(uint8(meanImg));
end
function new_img = gauLowPass(sigma, raw_img)

% define the standard deviation of gaussian function
% sigma = 1;

%define the size of the mask from a defined sigma value
%mask will always be odd
maskSize = 2*(3*sigma)-1;

%create matrix to store mask values
mask = ones(maskSize);

%find central value of mask
maskCentre = ceil(maskSize/2);

%define gaussian function
syms gWeight(x,y);
gWeight(x,y) = exp(-(x^2+y^2)/(2*sigma^2));

%create Window
%loop through each element in the window matrix
for i=1:maskSize
    %calculate horizontal distance from the centrepoint 
    y = ceil(abs(maskCentre-i));
    for j=1:maskSize
        %calculate vertical distance from the centre point
        x = ceil(abs(maskCentre-j));
        %assign gaussian weight to the position in the filter window
        mask(i,j) = gWeight(x,y);
    end
end

%find total sum of weights in the mask
maskSum = sum(mask, 'all');

%divide mask by sum
mask = mask/maskSum;

%perform convolution of mask and unfiltered image
new_img = convolution(maskSize,mask,raw_img);
%new_img = conv2(raw_img, mask, 'same');

%plot image to compare with original
imshow(uint8([raw_img, new_img]));

end
function filtered_img = sharpeningFilter(w, unfiltered_img)
%define the size of the mask

% %create the window
% window = ones(w);
% 
% %make all surrounding values negative
% window = -window;
% 
% %define central value
% window(ceil(w/2),ceil(w/2)) = 9;
window = [0 -1 0;-1 5 -1;0 -1 0];

filtered_img = convolution(w, window, unfiltered_img);

imshow(uint8(filtered_img))
end
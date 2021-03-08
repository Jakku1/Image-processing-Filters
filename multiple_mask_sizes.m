% mask_sizes = [1 3 5 7 9 11 15 21 35];
% 
% for loop = 1:length(mask_sizes)
%     
% end

unfiltered_img = ultra_img;
%  mask3 = adaptiveLinear(3, unfiltered_img);
%  mask5 = adaptiveLinear(5, unfiltered_img);
% mask7 = adaptiveLinear(7, unfiltered_img);
% mask9 = adaptiveLinear(9, unfiltered_img);
% mask11 = adaptiveLinear(11, unfiltered_img);
% mask15 = adaptiveLinear(15, unfiltered_img);
% mask21 = adaptiveLinear(21, unfiltered_img);
% mask35 = adaptiveLinear(35, unfiltered_img);
% mask55 = adaptiveLinear(55, unfiltered_img);

%mask1 = adaptiveLinear(1, unfiltered_img);
lmask3 = edge(mask3,'Sobel');
lmask5 = edge(mask5,'Sobel');
lmask7 = edge(mask7,'Sobel');
lmask9 = edge(mask9,'Sobel');
lmask11 = edge(mask11,'Sobel');
lmask15 = edge(mask15,'Sobel');
lmask21 = edge(mask21,'Sobel');
 lmask35 = edge(mask35,'Sobel');
 lmask55 = edge(mask55,'Sobel');



%imshow(uint8([lmask3, lmask5, lmask7, lmask9; lmask11, lmask15, lmask21, lmask35]));
imshow([lmask3, lmask5, lmask7; lmask9, lmask11, lmask15; lmask21, lmask35, lmask55]);
%imshow(uint8([mask3, mask5, mask7; mask9, mask11, mask15; mask21, mask35, mask55]));
function convImg = convolution(w, window, img)

%determine the size of the image
%imgSize = [height(img) width(img)];
[img_m, img_n] = size(img);

%number of padded layers needed 
pad = floor(w/2);

%create an empty array to pad img with
pdImg = zeros(img_m+w-1,img_n+w-1);

%place img in centre of padding array
pdImg(1+pad:img_m+pad,1+pad:img_n+pad) = img;

%create empty new image
newImg = zeros(img_m+2,img_n+2);

% 2D convolution of the image and the filter
for i = 1:img_m
    for j = 1:img_n
        %get element from image
         section =  pdImg(i:i+w-1,j:j+w-1);
         newSection = zeros(3);
         %loop through element and window values
         for n=1:w
             for k=1:w
                 %multiply array values by window values
                 newSection(n,k) = section(n,k)*window(n,k);                
             end
         end
         %add together all the values in the new element
        new_value = sum(newSection, 'all');
        %set the value of the pixel in the new image
        newImg(i+pad,j+pad) = new_value;
    end
end

%remove the padding from the image
convImg = newImg(pad+1:img_m+pad,pad+1:img_n+pad);
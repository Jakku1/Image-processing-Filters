function filtered_img = trimMean(w, raw_img)

%get dimensions of image
[img_m, img_n] = size(raw_img);

%number of padded layers needed 
pad = floor(w/2);

%window mid point
mid = ceil(w/2);

%create an empty array to pad img with
pdImg = zeros(img_m+w-1,img_n+w-1);

%place img in centre of padding array
pdImg(1+pad:img_m+pad,1+pad:img_n+pad) = raw_img;

%create empty new image
filtered_img = zeros(img_m,img_n);

%Loop through every pixel in image
for i=1:img_m
    for j=1:img_n
        %select window of values
        section = pdImg(i:i+w-1,j:j+w-1);
        %sorted vector of window values
        sorted_section = sort(section(:));
        %remove first and last of the sorted values
        trimmed_section = sorted_section(2:end-1);
        %assign value to new image
        filtered_img(i,j) = mean(trimmed_section);
    end
end

%show image compared to original
imshow(uint8([raw_img, filtered_img]))

end
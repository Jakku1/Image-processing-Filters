function filtered_img = medianFilter(w,unfiltered_image)

%define dimensions of image
[int_n, int_m] = size(unfiltered_image);

%find upper and lower bounds of mid point
upper = ceil(w/2);
lower = floor(w/2);

%pad the image
pdImg = zeros(int_n+w-1, int_m+w-1);
pdImg(upper:int_n+lower,upper:int_m+lower) = unfiltered_image;

%create empty array to store filtered image
filtered_img = zeros(int_n, int_m);

%loop through all pixels in image
for i = 1:int_n
    for j =1:int_m
        %define window values
        section =  pdImg(i:i+w-1,j:j+w-1);
        %sort section
        sorted_section = sort(section(:));
        %define mid point
        mid_point = length(sorted_section)/2;
        %find the median value
        if mod(length(sorted_section) , 2) ~= 0
            median_pos = ceil(mid_point);
            median_value = sorted_section(median_pos);
        else 
            %if two medians, randomly pick one
            median_pos = [floor(mid_point), ceil(mid_point)];
            random_sel = randi([1, 2], 1);
            median_value = sorted_section(median_pos(random_sel));
        end
        %save value to corresponding pixel in new image
        filtered_img(i,j) = median_value;
    end
end

%show image next to original for copmarison
imshow(uint8([unfiltered_image, filtered_img]));
end
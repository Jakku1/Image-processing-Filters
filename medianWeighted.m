function filtered_img = medianWeighted(w, raw_img)

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

%create window of correct size
window = ones(w);

%create centre point weighted
window(mid,mid) = 3;

%loop through all pixels in the window
for i = 1:img_m
    for j =1:img_n
        %select section of image
        section =  pdImg(i:i+w-1,j:j+w-1);
        %empty array to store values 
        values_list = [];
        %loop through every element in the window
        for k = 1:numel(window)
            %obtain respective weight value
            weight = window(k);
            %add one instance of the pixel value for unit of weight
            for l = 1:weight
                values_list(end+1) = section(k);
            end
        end
        %sort weighted values
        sorted_section = sort(values_list);
        %determine mid point of the values
        mid_point = length(sorted_section)/2;
        %find the median value
        if mod(length(sorted_section) , 2) ~= 0
            median_pos = ceil(mid_point);
            median_value = sorted_section(median_pos);
        else 
            median_pos = [floor(mid_point), ceil(mid_point)];
            %randomly pick between values if there are 2 median values
            random_sel = randi([1, 2], 1);
            median_value = sorted_section(median_pos(random_sel));
        end
        %write new pixel value
        filtered_img(i,j) = median_value;
    end
end
%show image to compare with original
imshow(uint8([raw_img, filtered_img]));
end
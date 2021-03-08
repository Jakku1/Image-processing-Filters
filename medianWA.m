function filtered_img = medianWA(w, raw_img)

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

window = ones(w);
window(5) = 3;

mask_dist = zeros(length(window));

for i=1:length(window)
    %calculate horizontal distance from the centrepoint 
    y = ceil(abs(mid-i));
    for j=1:length(window)
        %calculate vertical distance from the centre point
        x = ceil(abs(mid-j));
        mask_dist(i,j) = sqrt(x^2 + y^2);
    end
end


%loop through rows and columns
for i = 1:img_m
    for j =1:img_n
        %grab window in image
        section =  pdImg(i:i+w-1,j:j+w-1);
        
        %find sum of window
        section_sum = sum(section, 'all');
        %define constant c
        c = 5;
        %calculate mean of window
        mean = section_sum/numel(section);
        %calculate standard deviation of window
        std_dev = std(section,[], 'all');
        
        %create empty list to store values
        %epty values list from previous loop
        values_list = [];
        
        %loop through each element in the window
        for k = 1:numel(window)
            %calculate new weight of position in window
            weight = (window(k)-c*mask_dist(k)*std_dev/mean);
            %add pixel value to values list, number of times = weight
            for l = 1:abs(round(weight));
                %values_list(end+1) = section(k);
                values_list = [values_list, section(k)];
            end
        end
        sorted_section = sort(values_list);
        mid_point = ceil(length(sorted_section)/2);
        if mod(length(sorted_section) , 2) ~= 0
            median_pos = ceil(mid_point);
            median_value = sorted_section(median_pos);
        else 
            median_pos = [floor(mid_point), ceil(mid_point)];
            random_sel = randi([1, 2], 1);
            median_value = sorted_section(median_pos(random_sel));
        end
        filtered_img(i,j) = median_value;
    end
end
imshow(uint8([raw_img, filtered_img]));
end
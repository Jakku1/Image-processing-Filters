function new_img = adaptiveLinear(w, raw_img)

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
new_img = zeros(img_m,img_n);

%store k values
k_var = zeros(img_m,img_n);

%loop through the image
for i = 1:img_m
    for j = 1:img_n
        %get window selection
        selection = pdImg(i:i+w-1,j:j+w-1);
        %calculate mean of window selection
        mean = sum(selection, 'all')/w^2;
        %calculate standard deviation of window selection
        st_dev = std(selection, 0, 'all');
        %calculate signal noise ratio
        snr = mean/st_dev;
        %assign current value
        current_value = selection(mid,mid);
        %calcualte k keeping betwen 0 and 1
        %k is proportional to the inverse of the SNR
        k = abs(1/(2*snr));
        %store k value
        k_var(i,j) = k;
        %calcualte new value for filtered image
        new_value = mean + k*(current_value - mean);
        %assign new value to new image in correct position
        
        new_img(i,j) = new_value;
        
    end
end

new_img(isnan(new_img))=0;

%display new image next to raw image
imshow(uint8([raw_img,new_img]));

%plot how k varies throughout the image
k_var = k_var(:);
plot(k_var(1:1:end));
end
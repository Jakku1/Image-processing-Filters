function filteredImg = applyFilter(filter, file, wSize)

img = readimg(file);

switch filter
    case 'mean'
        filteredImg = meanFilter(wSize, img);
    default
        error('filter does not exist');
end

end
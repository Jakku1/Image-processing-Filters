w = 3;

mid = ceil(w/2);

window = ones(w);

sigma = 1;

syms gWeight(x,y);
gWeight(x,y) = sqrt(x^2+y^2);%exp(-(x^2+y^2)/2*sigma^2);

%populate window with weights according to distance from the centre
for i=1:w
    %calculate horizontal distance from the centrepoint 
    y = ceil(abs(mid-i));
    for j=1:w
        %calculate vertical distance from the centre point
        x = ceil(abs(mid-j));
        window(i,j) = gWeight(x,y);
    end
end

window
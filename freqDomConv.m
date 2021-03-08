function fourierImg = freqDomConv(img)

N=10;

[img_n img_m] = size(img);

output = zeros(img_m,img_n);

sumOutput = 0;

% syms S[m,n]
% S[m,n] = exp(j()*2*pi()*(k/N)*m)*exp(2*j()*pi()*(l/N)*n));
% 
% syms F(u,v)
% F(u,v) = img(x,y)*exp((-i()*2*pi()*(u*x+y*v))/N);

[nx, ny] =ndgrid([0:img_m-1]-(img_m-1)/2,[0:img_n-1]-(img_n-1)/2 );

du=1;

for u = [0:img_m-1]-(img_m-1)/2
    dv=1;
    for v = [0:img_n-1]-(img_n-1)/2  
        sumOutput=sum(sum(img.*exp(-1i*2*pi()*(u*nx/img_m+v*ny/img_n))));
        output(du,dv) = sumOutput;
        dv=dv+1;
    end
    du=du+1;
end

imshow(uint8(abs(output)/60))

fourierImg = output;

end
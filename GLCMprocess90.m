function [ hasil ] = GLCMprocess90(image)

if(min(min(image)) == 0)
    image = image + 1;
end

[baris, kolom] = size(image);
maxIm = max(max(image));
G90 = zeros(maxIm,maxIm);

for m=1:baris-1
    for n=1:kolom
        temp90 = image(m:m+1,n:n);
        p = temp90(2,1);
        q = temp90(1,1);
        G90(p,q) = G90(p,q)+1;
        G90(q,p) = G90(q,p)+1;
    end
end

hasil = G90;

end
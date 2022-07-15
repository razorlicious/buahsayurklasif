function [ hasil ] = GLCMprocess0(image)

if(min(min(image)) == 0)
    image = image + 1;
end

[baris, kolom] = size(image);
maxIm = max(max(image));
G0 = zeros(maxIm,maxIm);

for k=1:baris
    for l=1:kolom-1
        p = image(k,1);
        q = image(k,l+1);
        G0(p,q) = G0(p,q)+1;
        G0(q,p) = G0(q,p)+1;
    end
end

hasil = G0;

end
function [ hasil ] = GLCMprocess45(image)

if(min(min(image)) == 0)
    image = image + 1;
end

[baris, kolom] = size(image);
maxIm = max(max(image));
G45 = zeros(maxIm,maxIm);

for i=1:baris-1
    for j=1:kolom-1
        temp1 = image(i:i+1,j:j+1);
        p = temp1(2,1);
        q = temp1(1,2);
        G45(p,q) = G45(p,q)+1;
        G45(q,p) = G45(q,p)+1;
    end
end

hasil = G45;

end
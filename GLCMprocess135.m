function [ hasil ] = GLCMprocess135(image)

if(min(min(image)) == 0)
    image = image + 1;
end

[baris, kolom] = size(image);
maxIm = max(max(image));
G135 = zeros(maxIm,maxIm);

for i=1:baris-1
    for j=1:kolom-1
        temp1 = image(i:i+1,j:j+1);
        p = temp1(2,2);
        q = temp1(1,1);
        G135(p,q) = G135(p,q)+1;
        G135(q,p) = G135(q,p)+1;
    end
end

hasil = G135;

end
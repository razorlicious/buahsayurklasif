function [ entropy ] = entropysearch( image )

image = image ./sum(image(:));
[baris, kolom] = size(image);
tampung = zeros(baris,kolom);

for i=1:baris
    for j=1:kolom
        temp2 = image(i,j);
        if(temp2==0)
            tampung(i,j) = 0;
        else
            a = -(temp2);
            b = log10(temp2);
            tampung(i,j)=a.*b;
        end
    end
end

entropy = tampung;
entropy = sum(sum(entropy));

end
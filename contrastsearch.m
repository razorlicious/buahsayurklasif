function [ contrast ] = contrastsearch( image )

[baris kolom] = size(image);
norm = image ./sum(image(:));
kon = 0;
kontras = 0;

for i=1:baris
    for j=1:kolom
        kont = (i-j)^2*norm(i,j);
        kontras = kont + kontras;
    end
end

contrast = kontras;

end
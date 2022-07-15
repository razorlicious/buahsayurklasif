function [ energy ] = energysearch( image )

[baris kolom] = size(image);
norm = image ./sum(image(:));
hasil = 0;

for i=1:baris
    for j=1:kolom
        if(norm(i,j)==0)
            hasil = hasil + 0;
        else
            hasil = hasil + (norm(i,j)^2);
        end
    end
end

energy = hasil;

end
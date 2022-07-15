function [ homogen ] = homogenitassearch( image )

[baris kolom] = size(image);
norm = image ./sum(image(:));
hasil = 0;

for i=1:baris
    for j=1:kolom
       a = i-j;
       if ( a < 0 )
           a=a*(-1);
       end
       hasil = hasil + ((norm(i,j))/(1+a));
    end
end

homogen = hasil;

end
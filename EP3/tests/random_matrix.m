n = input("");
m = input("");
A = rand(n,m, "double")*1000;
b = rand(n,1, "double")*1000;

disp(n)
disp(m)

for i=1:n
    for j=1:m
        disp(A(i,j))
    endfor
endfor

for i=1:n
        disp(b(i))
endfor

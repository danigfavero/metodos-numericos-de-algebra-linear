% Polinômio 1
t = 0:7;
t = t';
b = [11.9; 11.1; 8.8; 7.5; 6.1; 3.5; 1.7; 0.0];
x = [0, 0];
x(1) = input("");
x(2) = input("");

tt = 0:.01:7;
p1 = x(1) + x(2)*tt;
plot(t, b, "o", tt, p1);
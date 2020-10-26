% a
t = 1:.5:3
t = t'
s = ones(5,1)
A = [s t]
b = [1.1; 1.2; 1.3; 1.4; 1.5]
x = A \ b

tt = 1:.01:3
p1 = x(1) + x(2)*tt
plot(t, b, "o", tt, p1)

y = [x(1) + x(2)*t]
r = y - b
norm(r)

% b
t = 1:.5:3
t = t'
t2 = t.^2
s = ones(5,1)
A = [s t t2]
b = [1.1; 1.2; 1.3; 1.4; 1.5]
x = A \ b

tt = 1:.01:3
p2 = x(1) + x(2)*tt+ x(3)*tt.^2
plot(t, b, "o", tt, p2)

y = [x(1) + x(2)*t + x(3)*t2]
r = y - b
norm(r)

% c
t = 1:.5:3
t = t'
t2 = t.^2
t3 = t.^3
t4 = t.^4
s = ones(5,1)
A = [s t t2 t3 t4]
b = [1.1; 1.2; 1.3; 1.4; 1.5]
x = A \ b

tt = 1:.01:3
p5 = x(1) + x(2)*tt+ x(3)*tt.^2 + x(4)*tt.^3 + x(5)*tt.^4
plot(t, b, "o", tt, p5, "-r", tt, p1, ":y", tt, p2, "--g")

y = [x(1) + x(2)*t + x(3)*t2 + x(4)*t3 + x(5)*t4]
r = y - b
norm(r)

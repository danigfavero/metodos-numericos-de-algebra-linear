<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


## Lista 7 - MAC0300

Daniela Gonzalez Favero - 10277443 - 26/10/2020

Exercícios extraídos do livro *"Fundamentals of Matrix Computations" - David S. Watkins (John Wiley & Sons, 1991)*.

**3.1.5**   

**(a)** Como o polinômio é de grau 1 e foram fornecidos 5 pontos, temos:
$$
\begin{bmatrix}
\phi_1(t_1) & \phi_2(t_1) \\
\phi_1(t_2) & \phi_2(t_2) \\
\phi_1(t_3) & \phi_2(t_3) \\
\phi_1(t_4) & \phi_2(t_4) \\
\phi_1(t_5) & \phi_2(t_5) \\
\end{bmatrix}
\begin{bmatrix}
x_1 \\ 
x_2
\end{bmatrix}
=
\begin{bmatrix}
y_1 \\ 
y_2 \\
y_3 \\ 
y_4 \\
y_5
\end{bmatrix}
\implies
\begin{bmatrix}
1.0 & 1.0 \\
1.0 & 1.5 \\
1.0 & 2.0 \\
1.0 & 2.5 \\
1.0 & 3.0 \\
\end{bmatrix}
\begin{bmatrix}
x_1 \\ 
x_2
\end{bmatrix}
=
\begin{bmatrix}
1.1 \\ 
1.2 \\
1.3 \\ 
1.4 \\
1.5
\end{bmatrix}
$$
**(b)** Código em *Octave*:

```octave
t = 1:.5:3
t = t'
s = ones(5,1)
A = [s t]
b = [1.1; 1.2; 1.3; 1.4; 1.5]
x = A \ b
```

Saída do programa:

```octave
x = 0.90000
    0.20000
```

**(c)** Código em *Octave*:

```octave
tt = 1:.01:3
p1 = x(1) + x(2)*tt
plot(t, b, "o", tt, p1)
```

Saída do programa:

![](/home/dani/Documents/mac300/LISTAS/lista7a.png)

**(d)** Código em *Octave*:

```octave
y = [x(1) + x(2)*t]
r = y - b
norm(r)
```

Saída do programa:

```octave
ans = 9.1551e-16
```

**3.1.6**   

**(a)** Como o polinômio é de grau 2 e foram fornecidos 5 pontos, temos:
$$
\begin{bmatrix}
\phi_1(t_1) & \phi_2(t_1) & \phi_3(t_1) \\
\phi_1(t_2) & \phi_2(t_2) & \phi_3(t_2) \\
\phi_1(t_3) & \phi_2(t_3) & \phi_3(t_3) \\
\phi_1(t_4) & \phi_2(t_4) & \phi_3(t_4) \\
\phi_1(t_5) & \phi_2(t_5) & \phi_3(t_5) \\
\end{bmatrix}
\begin{bmatrix}
x_1 \\ 
x_2 \\
x_3
\end{bmatrix}
=
\begin{bmatrix}
y_1 \\ 
y_2 \\
y_3 \\ 
y_4 \\
y_5
\end{bmatrix}
\implies
\begin{bmatrix}
1.0 & 1.0 & 1.0 \\
1.0 & 1.5 & 2.25 \\
1.0 & 2.0 & 4.0 \\
1.0 & 2.5 & 6.25 \\
1.0 & 3.0 & 9.0 
\end{bmatrix}
\begin{bmatrix}
x_1 \\ 
x_2 \\
x_3
\end{bmatrix}
=
\begin{bmatrix}
1.1 \\ 
1.2 \\
1.3 \\ 
1.4 \\
1.5
\end{bmatrix}
$$
**(b)** Código em *Octave*:

```octave
t = 1:.5:3
t = t'
t2 = t.^2
s = ones(5,1)
A = [s t t2]
b = [1.1; 1.2; 1.3; 1.4; 1.5]
x = A \ b
```

Saída do programa:

```octave
x =  9.0000e-01
     2.0000e-01
    -1.3878e-16
```

**(c)** Código em *Octave*:

```octave
tt = 1:.01:3
p2 = x(1) + x(2)*tt+ x(3)*tt.^2
plot(t, b, "o", tt, p2)
```

Saída do programa:

![](/home/dani/Documents/mac300/LISTAS/lista7b.png)

**(d)** Código em *Octave*:

```octave
y = [x(1) + x(2)*t + x(3)*t2]
r = y - b
norm(r)
```

Saída do programa:

```octave
ans = 1.5060e-15
```

**3.1.7**   

**(a)** Como o polinômio é de grau 2 e foram fornecidos 5 pontos, temos:
$$
\begin{bmatrix}
\phi_1(t_1) & \phi_2(t_1) & \phi_3(t_1) & \phi_4(t_1) & \phi_5(t_1) \\
\phi_1(t_2) & \phi_2(t_2) & \phi_3(t_2) & \phi_4(t_2) & \phi_5(t_2) \\
\phi_1(t_3) & \phi_2(t_3) & \phi_3(t_3) & \phi_4(t_3) & \phi_5(t_3) \\
\phi_1(t_4) & \phi_2(t_4) & \phi_3(t_4) & \phi_4(t_4) & \phi_5(t_4) \\
\phi_1(t_5) & \phi_2(t_5) & \phi_3(t_5) & \phi_4(t_5) & \phi_5(t_5) \\
\end{bmatrix}
\begin{bmatrix}
x_1 \\ 
x_2 \\
x_3 \\
x_4 \\
x_5
\end{bmatrix}
=
\begin{bmatrix}
y_1 \\ 
y_2 \\
y_3 \\ 
y_4 \\
y_5
\end{bmatrix}
\\ \implies
\begin{bmatrix}
1.0 & 1.0 & 1.0 & 1.0 & 1.0 \\
1.0 & 1.5 & 2.25 & 3.375 & 5.0625 \\
1.0 & 2.0 & 4.0 & 8.0 & 16.0 \\
1.0 & 2.5 & 6.25 & 15.625 & 39.0625 \\
1.0 & 3.0 & 9.0 & 27.0 & 81.0 \\
\end{bmatrix}
\begin{bmatrix}
x_1 \\ 
x_2 \\
x_3 \\
x_4 \\
x_5
\end{bmatrix}
=
\begin{bmatrix}
1.1 \\ 
1.2 \\
1.3 \\ 
1.4 \\
1.5
\end{bmatrix}
$$
**(b)** Código em *Octave*:

```octave
t = 1:.5:3
t = t'
t2 = t.^2
t3 = t.^3
t4 = t.^4
s = ones(5,1)
A = [s t t2 t3 t4]
b = [1.1; 1.2; 1.3; 1.4; 1.5]
x = A \ b
```

Saída do programa:

```octave
x =  9.0000e-01
     2.0000e-01
     1.3619e-14
    -4.7370e-15
     5.9212e-16
```

**(c)** Código em *Octave*:

```octave
tt = 1:.01:3
p5 = x(1) + x(2)*tt+ x(3)*tt.^2 + x(4)*tt.^3 + x(5)*tt.^4
plot(t, b, "o", tt, p5, "-r", tt, p1, ":y", tt, p2, "--g")
```

Saída do programa:

![](/home/dani/Documents/mac300/LISTAS/lista7c.png)

**(d)** Código em *Octave*:

```octave
y = [x(1) + x(2)*t + x(3)*t2 + x(4)*t3 + x(5)*t4]
r = y - b
norm(r)
```

Saída do programa:

```octave
ans = 3.1402e-16
```
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


## Lista 9 - MAC0300

Daniela Gonzalez Favero - 10277443 - 09/11/2020

Exercícios extraídos do livro *"Fundamentals of Matrix Computations" - David S. Watkins (John Wiley & Sons, 1991)*.

**3.4.26** **(a)** Aplicando o processo de ortogonalização de Gram-Schmidt clássico:

- Para $k = 1$:
  $$
  r_{11} \leftarrow \|v_1\|_2 = \sqrt{(1^2+\epsilon^2)} = 1 \\
  v_1 \leftarrow (1/r_{11})v_1 = v_1
  $$

- Para $k = 2$:

  - Para $i=1$:
    $$
    r_{12} \leftarrow \langle v_2,v_1 \rangle = 1^2 + \epsilon \times0 + 0\times\epsilon + 0^2 = 1
    $$
    

  - Para $i=1$:

  $$
  v_2 \leftarrow v_2 - v_1r_{12} = v_ 2 - v_1 = \begin{bmatrix} 1-1\\ 0 - \epsilon \\ \epsilon - 0 \\ 0-0\end{bmatrix} = \begin{bmatrix} 0\\ -\epsilon \\
  \epsilon \\ 0\end{bmatrix}
  $$

  Então:
  $$
  r_{22} \leftarrow \|v_2\|_2 = \sqrt{(\epsilon^2+\epsilon^2)} = \sqrt{2}\epsilon \\
  
  v_2 \leftarrow (1/r_{22})v_2 = \frac{1}{\sqrt{2}\epsilon} \begin{bmatrix} 0\\ \epsilon \\ - \epsilon \\ 0\end{bmatrix} = \begin{bmatrix} 0\\ -\frac{1}{\sqrt{2}} \\  \frac{1}{\sqrt{2}} \\ 0\end{bmatrix}
  $$

- Para $k = 3$:

  - Para $i=1$:
    $$
    r_{13} \leftarrow \langle v_3,v_1 \rangle =  1^2 + \epsilon\times 0 + 0^2 + 0\times \epsilon = 1
    $$

  - Para i = 2:
    $$
    r_{23} \leftarrow \langle v_3,v_2 \rangle =  1\times0 + \frac{1}{\sqrt{2}}\times 0 - \frac{1}{\sqrt{2}}\times 0 + 0\times \epsilon = 0
    $$

  - Para $i=1$:

  $$
  v_3 \leftarrow v_3 - v_1r_{13} = v_3 - v_1 = \begin{bmatrix} 1-1\\ 0 - \epsilon \\ 0-0 \\  \epsilon-0\end{bmatrix} = \begin{bmatrix} 0\\ - \epsilon \\
  0 \\ \epsilon\end{bmatrix}
  $$

  - Para $i=2$:
    $$
    v_3 \leftarrow v_3 - v_2r_{23} = v_3
    $$

  Então:
  $$
  r_{33} \leftarrow \|v_3\|_2 = \sqrt{\epsilon^2 + \epsilon^2} = \sqrt{2}\epsilon \\
  
  v_3 \leftarrow (1/r_{33})v_3 = \frac{1}{\sqrt{2}\epsilon} \begin{bmatrix} 0\\ -\epsilon \\ 0 \\ \epsilon \end{bmatrix} = \begin{bmatrix} 0\\ -\frac{1}{\sqrt{2}} \\ 0 \\ \frac{1}{\sqrt{2}} \end{bmatrix}
  $$
  

Por fim, temos:
$$
v_1 = \begin{bmatrix} 1\\ \epsilon \\ 0 \\ 0\end{bmatrix},\ \ \ \ \ v_2 = \begin{bmatrix} 0\\ -\frac{1}{\sqrt{2}} \\  \frac{1}{\sqrt{2}} \\ 0\end{bmatrix},\ \ \ \ \  v_3= \begin{bmatrix} 0\\ -\frac{1}{\sqrt{2}} \\ 0 \\ \frac{1}{\sqrt{2}} \end{bmatrix}
$$
Portanto, $\langle v_1,v_2\rangle =-\frac{\epsilon}{\sqrt{2}}$, $ \langle v_1,v_3\rangle = \frac{\epsilon}{\sqrt{2}}$ e $\langle v_2,v_3\rangle = \frac{1}{2}$, ou seja, estão longes de serem ortogonais.

**(b)** Aplicando o processo de ortogonalização de Gram-Schmidt modificado:

- Para $k=1$ e $k=2$, nada muda. Então até agora temos:

$$
v_1 = \begin{bmatrix} 1\\ \epsilon \\ 0 \\ 0\end{bmatrix}\ \ \ \ \  \text{e}\ \ \ \ \ v_2 = \begin{bmatrix} 0\\ -\frac{1}{\sqrt{2}} \\ \frac{1}{\sqrt{2}} \\ 0\end{bmatrix}
$$

- Para $k=3$:
  - Para $i=1$:
    $$
    r_{13} \leftarrow \langle v_3,v_1 \rangle =  1^2 + \epsilon\times 0 + 0^2 + 0\times \epsilon = 1 \\
    
    v_3 \leftarrow v_3 - v_1r_{13} = v_3 - v_1 = \begin{bmatrix} 1-1\\ 0 - \epsilon \\ 0-0 \\  \epsilon-0\end{bmatrix} = \begin{bmatrix} 0\\ - \epsilon \\
    0 \\ \epsilon\end{bmatrix}
    $$
    

  - Para $i=2$:

$$
r_{23} \leftarrow \langle v_3,v_2 \rangle = 0^2 - \frac{1}{\sqrt{2}}\times \epsilon - \frac{1}{\sqrt{2}}\times 0 + \epsilon \times 0 =- \frac{\epsilon}{\sqrt{2}} \\

v_3 \leftarrow v_3 - v_2r_{23} = 
\begin{bmatrix} 0\\ 
- \epsilon \\
0 \\ 
\epsilon
\end{bmatrix} 
+ 
(\frac{\epsilon}{\sqrt{2}})
\begin{bmatrix} 
0\\ 
\frac{1}{\sqrt{2}} \\ 
- \frac{1}{\sqrt{2}} \\ 
0
\end{bmatrix} 
= 
\begin{bmatrix} 0\\ 
- \epsilon \\
0 \\ 
\epsilon
\end{bmatrix} 
+ 
\begin{bmatrix} 
0\\ 
\frac{\epsilon}{2} \\ 
- \frac{\epsilon}{2} \\ 
0
\end{bmatrix} 
= 
\begin{bmatrix} 
0\\ 
-\frac{\epsilon}{2} \\ 
- \frac{\epsilon}{2} \\ 
\epsilon
\end{bmatrix}
$$

​		  

Então:
$$
r_{33} \leftarrow \|v_3\|_2 = \sqrt{2(\frac{-\epsilon}{2})^2+\epsilon^ 2} = \sqrt{\frac{3\epsilon^2}{2}} = \frac{\sqrt{3}\epsilon}{\sqrt{2}} \\

v_3 \leftarrow (1/r_{33})v_3 
= 
\frac{1}{\frac{\sqrt{3}\epsilon}{\sqrt{2}}} 
\times
\begin{bmatrix} 
0\\ 
-\frac{\epsilon}{2} \\ 
- \frac{\epsilon}{2} \\ 
\epsilon
\end{bmatrix}
= 
\begin{bmatrix} 
0\\ 
-\frac{\sqrt{2}}{2\sqrt{3}} \\ 
- \frac{\sqrt{2}}{2\sqrt{3}} \\ 
\frac{\sqrt{2}}{\sqrt{3}}
\end{bmatrix}
$$
Por fim, temos:
$$
v_1 = \begin{bmatrix} 1\\ \epsilon \\ 0 \\ 0\end{bmatrix},\ \ \ \ \ v_2 = \begin{bmatrix} 0\\ -\frac{1}{\sqrt{2}} \\  \frac{1}{\sqrt{2}} \\ 0\end{bmatrix},\ \ \ \ \  v_3= \begin{bmatrix} 
0\\ 
-\frac{\sqrt{2}}{2\sqrt{3}} \\ 
- \frac{\sqrt{2}}{2\sqrt{3}} \\ 
\frac{\sqrt{2}}{\sqrt{3}}
\end{bmatrix}
$$
Portanto, $\langle v_1,v_2\rangle = -\frac{\epsilon}{\sqrt{2}}$, $\langle v_1,v_3\rangle = -\frac{\epsilon}{\sqrt{6}}$ e $\langle v_2,v_3\rangle = 0$, ou seja, são ortogonais.


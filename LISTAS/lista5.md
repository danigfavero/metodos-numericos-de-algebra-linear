<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


## Lista 5 - MAC0300

Daniela Gonzalez Favero - 10277443 - 30/09/2020

Exercícios extraídos do livro *"Fundamentals of Matrix Computations" - David S. Watkins (John Wiley & Sons, 1991)*.

**2.2.23**    

**(a)** Vamos encontrar a inversa de $A$ usando a propriedade de que $AA^{-1}=I$:
$$
\begin{bmatrix}
    375 & 374 \\
    752 & 750 
\end{bmatrix}
A^{-1}
=
\begin{bmatrix}
    1 & 0 \\
    0 & 1 
\end{bmatrix}
\implies
A^{-1}
= 
\begin{bmatrix}
    a & b \\
    c & d 
\end{bmatrix}
\text{ tal que }
\begin{cases}
	375a + 374c = 1 \\
	375b + 374d = 0 \\
	752a + 750c = 0 \\
	752b + 750d = 1
\end{cases}
$$
Utilizando substituições simples, chegamos em:
$$
A^{-1}
= 
\begin{bmatrix}
    375 & -182 \\
    -376 & \frac{375}{2}
\end{bmatrix}
$$
Agora vamos calcular $\kappa_{\infin}(A)$:
$$
\kappa_{\infin}(A) = \|A\|_{\infin}\|A^{-1}\|_{\infin}
$$
Pelo *Teorema 2.1.29*:
$$
\kappa_{\infin}(A) = \|A\|_{\infin}\|A^{-1}\|_{\infin} = \max_{1 \leq i \leq 2} \sum^2_{j=1} |a_{ij}|\times \max_{1 \leq i \leq 2} \sum^2_{j=1} |a^{-1}_{ij}| \\
= \max \{375 + 374, 752 + 750\} \times \max \{375 + 182, 376 + \frac{375}{2}\} \\
= \max \{749, 1502\} \times \max \{557, \frac{1127}{2}\} = 1502 \times \frac{1127}{2} = 846377
$$
Portanto:
$$
\kappa_{\infin}(A) = 8.46377 \times 10^5
$$


**(b)**  Para encontrarmos tais $b$, $\delta b$, $x$ e $\delta x$, precisamos de $x$ que esteja na direção de máxima magnificação de $A$ e $b$ na direção de mínima magnificação de $A^{-1}$, ou seja, tal que $\frac{\|Ax\|}{\|x\|}$ coincida com a norma da matriz $A$: 
$$
\frac{\| A x \|_{\infin}}{\| x \|_{\infin}} = \frac{\max | A x |}{\max | x |} = \|A\|_{\infin} = 1502
$$

Para isso vamos usar $x = \begin{bmatrix}1\\ 1 \end{bmatrix}$, que nos dá:
$$
Ax=b \implies 
\begin{bmatrix}
    375 & 374 \\
    752 & 750 
\end{bmatrix}
\begin{bmatrix}1\\ 1 \end{bmatrix} = b \implies 
b = \begin{bmatrix}749\\ 1502 \end{bmatrix}
$$
Além disso, também é necessário calcular o fator de magnificação em relação à inversa tal que:
$$
\frac{\| A^{-1}y \|_{\infin}}{\| y \|_{\infin}} = \frac{\max | A^{-1} y |}{\max | y |} = \|A^{-1}\|_{\infin} = \frac{1127}{2}
$$
Para isso vamos usar  $y = \begin{bmatrix}-1\\ 1 \end{bmatrix}$, que nos dá:
$$
A^{-1}y=c \implies 
\begin{bmatrix}
    375 & -182 \\
    -376 & \frac{375}{2} 
\end{bmatrix}
\begin{bmatrix}-1\\ 1 \end{bmatrix} = c \implies 
c = \begin{bmatrix}-557\\ \frac{1127}{2} \end{bmatrix}
$$
Agora, vamos resolver um sistema parecido com $Ax=b$, mas com uma pequena perturbação $\delta x$:
$$
\begin{bmatrix}
    375 & 374 \\
    752 & 750 
\end{bmatrix}
\begin{bmatrix}
	\hat{x}_ 1\\ 
	\hat{x}_ 2 
\end{bmatrix} 
=
\begin{bmatrix}
	748.99\\ 
	1502.01 
\end{bmatrix}
$$
Ou seja, $A \hat{x} = b + \delta b$, onde $\delta b = \begin{bmatrix}-0.01\\ 0.01 \end{bmatrix}$, que está na direção de máxima magnificação de $A^{-1}$. Resolvendo o sistema, temos:
$$
\begin{bmatrix}
	\hat{x}_ 1\\ 
	\hat{x}_ 2 
\end{bmatrix} 
= 
\begin{bmatrix}
	-4.62\\ 
	6.635 
\end{bmatrix}
\implies
\delta x
= 
\begin{bmatrix}
	-3.62\\ 
	5.635 
\end{bmatrix}
$$
Em conclusão, temos:
$$
\frac{\| \delta b\|_{\infin}}{\| b\|_{\infin}} = \frac{0.01}{1502} = 6.6578 \times 10^{-6}

\\
\frac{\| \delta x\|_{\infin}}{\| x\|_{\infin}} = \frac{5.635}{1} = 5.635
$$
ou seja, $\frac{\| \delta b\|_{\infin}}{\| b\|_{\infin}}$ é pequeno e $\frac{\| \delta x\|_{\infin}}{\| x\|_{\infin}}$ é máximo.



**(c)** Note que, para obter , $\frac{\| \delta b\|_{\infin}}{\| b\|_{\infin}}$ máximo e $\frac{\| \delta x\|_{\infin}}{\| x\|_{\infin}}$ pequeno, basta tomar um sistema que terá $b$ perturbado na direção de máxima magnificação de $A$, isto é:
$$
Ax=b \implies \begin{bmatrix}
    375 & 374 \\
    752 & 750 
\end{bmatrix}
\begin{bmatrix}
	x_ 1\\ 
	x_ 2 
\end{bmatrix} 
=
\begin{bmatrix}
	-1\\ 
	1 
\end{bmatrix}
\implies
x = 
\begin{bmatrix}
	-557\\ 
	\frac{1127}{2} 
\end{bmatrix}
$$
Agora vamos perturbar a solução na direção de máxima magnificação de $A$, ou seja, com $\delta x = \begin{bmatrix}
	0.01\\ 
	0.01 
\end{bmatrix}$ :
$$
A \hat{x} = 
\hat{b}
=
\begin{bmatrix}
    375 & 374 \\
    752 & 750 
\end{bmatrix}
\begin{bmatrix}
	-556.99\\ 
	563.51 
\end{bmatrix}
= 
\begin{bmatrix}
	-417185.51\\ 
	846392.02 
\end{bmatrix}
\implies
\delta b =
\begin{bmatrix}
	-417184.51\\ 
	846393.02 
\end{bmatrix}
$$
Portanto, temos:
$$
\frac{\| \delta b\|_{\infin}}{\| b\|_{\infin}} = \frac{846393.02}{1} = 846393.02

\\
\frac{\| \delta x\|_{\infin}}{\| x\|_{\infin}} = \frac{0.01}{\frac{1127}{2}} = 1.7746 \times 10^{-05}
$$
conforme queríamos.



**2.3.13** Seja $A$ não singular, $\frac{\| \delta A \|}{\| A \|} < \frac{1}{\kappa(A)}$, $b \neq 0$, $Ax = b$ e $(A + \delta A)(x + \delta x) = b + \delta b$.

Reescrevendo a equação $(A + \delta A)(x + \delta x) = b + \delta b$ como $Ax + A \delta x + \delta A (x + \delta x) = b + \delta b$, usando a equação $Ax = b$, e reorganizando a equação resultante, obtemos $\delta x = \delta b - A^{-1} \delta A (x + \delta x)$. Portanto:
$$
\| \delta x \| \leq \| \delta b + A^{-1} \delta A (x + \delta x)\|.
$$
Aplicando a desigualdade triangular (na expressão externa e depois em $x + \delta x$):
$$
\| \delta x \| \leq \| \delta b \| + \| A^{-1} \|\ \| \delta A \|\ ( \| x \| + \| \delta x \| )
= \| \delta b \| +  \kappa (A) \frac{ \| \delta A \| }{ \| A \| } ( \| x \| + \| \delta x \| ).
$$
Agora reescrevendo esta desigualdade de modo que todos os termos envolvendo $\| \delta x \|$ fiquem do lado esquerdo.
$$
(1 - \kappa(A) \frac{ \| \delta A \| }{ \| A \| })\ \| \delta x \| \leq \kappa(A) \frac{ \| \delta A \| }{ \| A \| } \| x \| + \| \delta b \|
$$
A suposição $\frac{ \| \delta A \| }{ \| A \| } < \frac{1}{\kappa(A)}$ garante que o fator que multiplica $\| \delta x \|$ é positivo, então podemos dividir por ele sem inverter a desigualdade. Se nós também dividirmos por $\| x \|$, obtemos o resultado:
$$
\frac{\| \delta x \|}{\| x \|} \leq \frac{\kappa(A) (\frac{ \| \delta A \| }{ \| A \| }) }{1 - \kappa(A) \frac{ \| \delta A \| }{ \| A \| }} + \frac{\| \delta b \|}{1 - \kappa(A) \frac{ \| \delta A \| }{ \| A \| }}.
$$
Como sabemos pelo *Teorema 2.2.4*,  $\frac{\| \delta x \|}{\| x \|} \leq \kappa(A)\frac{ \| \delta b \| }{ \| b \| }$. Então podemos multiplicar $\| \delta b \|$ por $\frac{ \| \kappa(A) \| }{ \| b \| }$ sem perder a propriedade da desigualdade. Ou seja:
$$
\frac{\| \delta x \|}{\| x \|} \leq \frac{\kappa(A) (\frac{ \| \delta A \| }{ \| A \| } + \frac{ \| \delta b \| }{ \| b \| }) }{1 - \kappa(A) \frac{ \| \delta A \| }{ \| A \| }},
$$
que é o que queríamos provar. $\square$


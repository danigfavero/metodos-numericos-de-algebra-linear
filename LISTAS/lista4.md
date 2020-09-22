<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


## Lista 4 - MAC0300

Daniela Gonzalez Favero - 10277443 - 30/09/2020

Exercícios extraídos do livro *"Fundamentals of Matrix Computations" de David S. Watkins (John Wiley & Sons, 1991)*.

**1.7.34**    

**(a)** Definindo os elementos das matrizes $A$, $M$ e $\hat{A}$ como $a_{kl}$, $m_{kl}$ e $\hat{a}_{kl}$ respectivamente (com $k$ e $l$ sendo o índice da linha e da coluna nas quais eles se encontram, variando de 1 a n), podemos expressar cada elemento da matriz $\hat{A}=MA$ como:
$$
\hat{a}_{kl} = a_{1l}m_{k1} + ... + a_{nl}m_{kn},\ \ \ \ \ \ \ \ \ \ \ k=1,...,n,\ l=1,...,n.
$$
Sabemos que se $k \neq i$, então $\hat{a}_{kl}=a_{kl}$, $ \ l=1,...,n$, ou seja, para todas as linhas diferentes de $i$, a matriz $M$ é a identidade.

Sabemos também que se  $k = i$, então $\hat{a}_{il}=a_{il} + ma_{jl}$, $ \ l=1,...,n$. Portanto, para a linha $i$, é necessário que o valor de $m$ seja aplicado (na forma do produto) sobre toda a linha. As entradas desta linha são do formato:
$$
\hat{a}_{il} = a_{1l}m_{i1} + ... + a_{jl}m_{ij} + ... + a_{nl}m_{in},\ \ \ \ \ \ \ \ \ \ \  l=1,...,n.
$$
De modo que o elemento $a_{jl}m_{ij}$ da soma vai multiplicar o elemento da j-ésima linha por $m$, ou seja, $m_{ij} = m. \square$  

**(b)** Como o determinante de qualquer matriz triangular é o produto dos elementos na diagonal principal, e $M$ é triangular da forma:
$$
\begin{bmatrix}
1 &   & ... &  \\
 ...& 1 &   &  \\
 & m & 1 &...  \\
 &   &  ... & 1 
\end{bmatrix}
$$
Então $det(M) = 1 \times ... \times 1 = 1$. $\square$

Sabemos que $\hat{A}=MA$. Portanto:
$$
det(\hat{A}) = det(MA)
$$
Pelas propriedades de determinante de matriz:
$$
det(MA) = det(M)det(A)
$$
E como deduzimos acima, $det(M) = 1$, portanto:	
$$
det(M)det(A) = det(A)
$$
Ou seja:
$$
det(\hat{A}) = det(A). \square
$$
**(c)** Sabemos que $MM^{-1}=I$. Basta supor que a inversa sugerida está correta e multiplicá-la com $M$, comparando a resposta com a identidade.
$$
\begin{bmatrix}
1 &   & ... &  \\
 ...& 1 &   &  \\
 & m & 1 &...  \\
 &   &  ... & 1 
\end{bmatrix} \times
\begin{bmatrix}
1 &   &  ... &  \\
... & 1 &   &  \\
 & -m & 1 &...  \\
 &   & ...  & 1 
\end{bmatrix}
$$
A multiplicação das linhas e colunas que não contêm $m$, vão sempre possuir só 1 elemento não nulo (=1) para preencher a linha do resultado. Ao chegar nas linhas e colunas que contêm $m$, a maior parte dos $m$ vai ser multiplicado por 0. A única vez em que $m$ será multiplicado por 1, ele irá coincidir com o $-m$ da inversa, porque estão na mesma posição da matriz. Deste modo, eles se anularão e produzirão mais um 0, assim obtendo a identidade. $\square$

$M^{-1}$ corresponde a subtrair $m$ vezes a j-ésima linha da i-ésima coluna.

**1.7.44**

**(a)** Tome $M = L^{-1}$.  Vamos provar que $M$ é triangular inferior por indução na dimensão ($n$) da matriz. 

*BASE:* $n=1$.
$$
L =
\begin{bmatrix}
l_{11}
\end{bmatrix},\ \ \ \
M =
\begin{bmatrix}
m_{11}
\end{bmatrix}, L\times M = I
\implies 
M = 
\begin{bmatrix}
\frac{1}{l_{11}}
\end{bmatrix}
$$
Ou seja, $M$ é triangular inferior para $n=1$. 

*HIPÓTESE DE INDUÇÃO:* suponha que, para $(n-1) \times (n-1)$, se $L$ é triangular inferior, então $M$ também é. Agora tome $L$ e $M$ de dimensões $n \times n$. Particione-as da mesma forma:
$$
L =
\begin{bmatrix}
L_{11} & 0 \\
L_{21} & L_{22}
\end{bmatrix},\ \ \ \
M =
\begin{bmatrix}
M_{11} & M_{12} \\
M_{21} & M_{22}
\end{bmatrix}
$$
tal que $L_{11}$ e $M_{11}$ são quadradas; e  $L_{11}$ e $L_{22}$ são triangulares inferiores, não singulares e de dimensões menores que $(n-1) \times (n-1)$.

Como $M = L^{-1}$, temos que $LM=I$, ou seja:
$$
\begin{bmatrix}
L_{11} & 0 \\
L_{21} & L_{22}
\end{bmatrix}
\times
\begin{bmatrix}
M_{11} & M_{12} \\
M_{21} & M_{22}
\end{bmatrix}
=
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix}
$$


Daí tiramos o sistema:
$$
\begin{cases}
L_{11}M_{11} = 1 \\
L_{11}M_{12} = 0 \\
L_{21}M_{11} + L_{22}M_{21} = 0 \\
L_{21}M_{12} + L_{22}M_{22} = 1 
\end{cases}
\ \ \ \ \implies \ \ \ \
\begin{cases}
M_{11} = 1/L_{11} = L_{11}^{-1} \\
M_{12} = 0 \\
L_{21}M_{11} + L_{22}M_{21} = 0 \\
L_{21}M_{12} + L_{22}M_{22} = 1 
\end{cases}
\ \ \ \ \implies \ \ \ \
\begin{cases}
M_{11} = L_{11}^{-1} \\
M_{12} = 0 \\
M_{21} = -L_{21}L_{11}^{-1}/L_{22} \\
M_{22} = 1/L_{22} = L_{22}^{-1}
\end{cases}
$$
(Note que podemos inverter $L_{11}$ e  $L_{22}$ porque assumimos que elas são não singulares)

Como, pela hipótese de indução, $L_{11}$ e $L_{22}$ são menores que $(n-1) \times (n-1)$, então a matriz $M$ fica assim:
$$
M =
\begin{bmatrix}
L_{11}^{-1} & 0 \\
-L_{21}L_{11}^{-1}L_{22}^{-1} & L_{22}^{-1}
\end{bmatrix}
$$
Que é triangular inferior. $\square$

**(b)** Vamos provar que as entradas da diagonal principal de $L^{-1}$ são $l_{11}^{-1},\ l_{22}^{-1},\ ...,\ l_{nn}^{-1}$ por indução na dimensão ($n$) da matriz. 

*BASE:* $n=1$.
$$
L =
\begin{bmatrix}
l_{11}
\end{bmatrix},\ \ \ \ L\times L^{-1} = I
\implies 
 L^{-1} = 
\begin{bmatrix}
\frac{1}{l_{11}}
\end{bmatrix} =
\begin{bmatrix}
l_{11}^{-1}
\end{bmatrix}
$$
Ou seja, a entrada da diagonal principal de $L^{-1}$ é  $l_{11}^{-1}$  para $n=1$. 

*HIPÓTESE DE INDUÇÃO:* suponha que, para $(n-1) \times (n-1)$, as entradas da diagonal principal de $L^{-1}$ são $l_{11}^{-1},\ l_{22}^{-1},\ ...,\ l_{n-1,n-1}^{-1}$. 

Agora tome $L^{-1}$ de dimensão $n \times n$. Podemos particionar a matriz desta maneira:
$$
L^{-1} =
\begin{bmatrix}
A & b \\
c & d
\end{bmatrix}
$$
tal que $A$ tenha tamanho $(n-1) \times (n-1)$, $b$ e $c$ sejam vetores de tamanho adequado, e $d$ seja o próximo valor que estamos colocando na diagonal. Pelo item **(a)**, temos que:
$$
L^{-1} =
\begin{bmatrix}
L_{11}^{-1} & 0 \\
-L_{21}L_{11}^{-1}L_{22}^{-1} & l_{22}^{-1}
\end{bmatrix}
$$
Que mostra que, por hipótese de indução, provamos que as entradas da diagonal principal de $L^{-1}$ são $l_{11}^{-1},\ l_{22}^{-1},\ ...,\ l_{nn}^{-1}$. $\square$



**1.7.45**

Resposta


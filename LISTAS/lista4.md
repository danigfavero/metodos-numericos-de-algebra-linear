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

Resposta

**1.7.45**

Resposta


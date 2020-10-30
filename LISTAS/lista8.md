<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


## Lista 8 - MAC0300

Daniela Gonzalez Favero - 10277443 - 02/11/2020

Exercícios extraídos do livro *"Fundamentals of Matrix Computations" - David S. Watkins (John Wiley & Sons, 1991)*.

**3.2.25**  Seja $u \in \mathbb{R}^n = 1$ com $\|u\|_2=1$ e defina $P \in \mathbb{R}^{n \times n}$ como $P=uu^T$. Então:

**(a)**  Multiplicando a definição de $P$ por $u$:
$$
Pu = (uu^T)u = u(u^Tu).
$$
Como $u^Tu=\|u\|_2$:
$$
Pu = u\|u\|_2^2.
$$
 E como $\|u\|_2=1$, então $\|u\|_2^2=1$:
$$
Pu = u.
$$
**(b)** Tome $v$ tal que $\langle u,v \rangle = 0$. Vamos multiplicar a definição de $P$ por $v$:
$$
Pv = (uu^T)v = u(u^Tv).
$$
Mas, como $u$ e $v$ são ortogonais, então $u^Tv = 0$:
$$
Pv = 0.
$$
**(c)** Multiplicando $P$ por $P$ e usando sua definição:
$$
PP = uu^Tuu^T = u(u^Tu)u^T.
$$
Mas $u^Tu=\|u\|_2=1$, então:
$$
PP = u(1)u^T = P.
$$
**(d)** Tomando a transposta de $P$ e usando sua definição:
$$
P^T=(uu^T)^T.
$$
Pela propriedade da transposição do produto de matrizes ($(AB)^T=B^TA^T$):
$$
P^T= (u^T)^T(u)^T = uu^T = P.\ \ \ \ \ \ \ \ \ \ \square
$$
**3.2.27**   Seja $u \in \mathbb{R}^n = 1$ com $\|u\|_2=1$ e defina $Q \in \mathbb{R}^{n \times n}$ como $Q=I-2uu^T$. Então:

**(a)** Multiplicando a definição de $Q$ por $u$, e usando que $P = uu^T$:
$$
Qu = Iu - 2(uu^T)u = u - 2Pu.
$$
Como $Pu = u$, então:
$$
Qu = u - 2u = u.
$$
**(b)**  Tome $v$ tal que $\langle u,v \rangle = 0$. Vamos multiplicar a definição de $Q$ por $v$:
$$
Qv = Iv - 2uu^Tv = v - 2u(u^Tv).
$$
Mas, como $u$ e $v$ são ortogonais, então $u^Tv = 0$:
$$
Qv = v.
$$
**(c)** Tomando a transposta de $Q$ e usando sua definição:
$$
Q^T = (I-2uu^T)^T.
$$
Pela propriedade distributiva da transposição para soma e subtração, temos:
$$
Q^T = I^T - 2 (uu^T)^T.
$$
Pelas propriedades da transposição do produto de matrizes ($(AB)^T=B^TA^T$) e sabendo que $I^T=I$, temos:
$$
Q^T = I - 2(u^T)^Tu^T = I - 2uu^T = Q.
$$
**(d)** Elevando $Q$ ao quadrado e usando sua definição:
$$
Q^2=(I-2uu^T)2 = I^2 - 4uu^T + 4uu^Tuu^T.
$$
Como $u^Tu = 1$ e $I^2 = I$, então:
$$
Q^2 = I - 4uu^T + 4 uu^T = I.
$$
Como $Q=Q^T$, também temos que $Q^TQ=1$, portanto $Q$ é ortogonal, ou seja:
$$
Q^T = Q^{-1}.
$$
**(e)** Do item (c), $Q^T=Q$ e do item (d), $Q^T=Q^{-1}$, portanto:
$$
Q^{-1} = Q^T = Q.\ \ \ \ \ \ \ \ \ \ \square
$$

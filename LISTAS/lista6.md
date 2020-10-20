<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


## Lista 6 - MAC0300

Daniela Gonzalez Favero - 10277443 - 20/10/2020

Exercícios extraídos do livro *"Fundamentals of Matrix Computations" - David S. Watkins (John Wiley & Sons, 1991)*.

**2.7.29**   

**(a)** Seja $A=R^TR$, a matriz $R$ tem entradas da forma:
$$
r_{ii} = \sqrt{a_{ii} - \sum_{k=1}^{i-1} r^2_{ki} }
$$
e
$$
r_{ij} = \frac{a_{ij} - \sum_{k=1}^{i-1} r_{ki}r_{kj} }{r_{ii}},\ \ \ \ \ \text{ para } i \neq j.
$$
Vamos considerar a computação de $r_{ij}$. Na prática os valores computados $\hat{r}_{ki}$, $\hat{r}_{kj}$ e $\hat{r}_{ii}$ são usados, desenvolvendo mais erros de arredondamento. Portanto o valor computado $\hat{r}_{ij}$ satisfaz:
$$
\hat{r}_{ij} = \text{fl}(\frac{a_{ij} - \sum_{k=1}^{i-1} \hat{r}_{ki}\hat{r}_{kj} }{\hat{r}_{ii}}).
$$
Da *Proposição 2.7.1* do livro, obtemos que: 
$$
\hat{r}_{ij} = \frac{a_{ij}(1+ \gamma _{ij}) - \sum_{k=1}^{i-1} \hat{r}_{ki}\hat{r}_{kj}(1+ \alpha _k)(1+ \gamma _{ik}) }{\hat{r}_{ii}(1+ \epsilon)}(1+ \beta),
$$
onde $|\gamma_{ij}| \leq (j-1)u + \mathcal{O}(u^2)$. As quantidades $\alpha_k$, $\beta$ e $\epsilon$ são os erros de arredondamento associados com as multiplicações, a divisão e a raiz quadrada, respectivamente, e elas satisfazem  $|\alpha_k| \leq u$, $|\beta| \leq u$ e $|\epsilon| \leq u$.

Prosseguindo, dividimos o numerador e o denominador por $\frac{(1 + \gamma_{ij})(1 + \beta)}{1 + \epsilon}$ para remover o erro do termo $a_{ij}$. Então simplificamos a equação resultante consolidando os erros. Defina $\delta_{ik}$ como
$$
1 + \delta_{ik} = 
\begin{cases} 
\frac{(1+ \alpha_k)(1+ \gamma_{ik})}{1+ \gamma_{ij}}\ \ \ \text{ se } k<j,\\
\frac{1+ \epsilon}{(1+ \gamma_{ij})(1+ \beta)}\ \ \ \text{ se } k=j.
\end{cases}
$$
Como $\frac{1}{1+ \gamma_{ij}} = 1 - \gamma_{ij} + \gamma_{ij}^2 - \gamma_{ij}^3 + \dots$, nós temos, para $k < j$, $\delta_{ik} = \alpha_k + \gamma_{ik} - \gamma{ij} + \mathcal{O}(u^2)$, e
$$
\begin{matrix}
|\delta_{ik}| & \leq & |\alpha_k| + |\gamma_{ik}| + |\gamma_{ij}| + \mathcal{O}(u^2) & &  \\
& \leq & u +(j-1)u + \mathcal{O}(u^2) + (j-1)u+ \mathcal{O}(u^2) & = & (2j-1)u + \mathcal{O}(u^2).
\end{matrix}
$$
Analogamente, $\delta_{ij} = -\gamma _{ij}-\frac{\beta}{\epsilon} + \mathcal{O}(u^2)$, e
$$
\begin{matrix}
|\delta_{ij}| & \leq & |\gamma_{ik}| + |\frac{\beta}{\epsilon}| + \mathcal{O}(u^2) & = & (2j-1)u + \mathcal{O}(u^2).
\end{matrix}
$$


Portanto
$$
|\delta_{ik}| \leq 2nu + \mathcal{O}(u^2),\ \ \ \ k=1,\dots,j.
$$
Em termos de $\delta_{ik}$, o valor computado das entradas de $R$ fica:
$$
\hat{r}_{ij} = \frac{a_{ij} - \sum_{k=1}^{i-1} \hat{r}_{ki}\hat{r}_{kj}(1+ \delta _{ik}) }{\hat{r}_{ii}(1+ \delta _{ij})}.
$$
Multiplicando por $\hat{r}_{ii}(1+\delta_{ij})$ e reescrevendo a expressão resultante tal que todos os termos de erro sejam consolidados em um termo único $e_{ij}$, temos
$$
a_{ij} + e_{ij} = \sum_{k=1}^{j}\hat{r}_{ki}\hat{r}_{kj} = \sum_{k=1}^{j}\hat{r}_{ik}^T\hat{r}_{kj},
$$
onde 
$$
e_{ij} = - \sum_{k=1}^{j}\hat{r}^T_{ik}\hat{r}_{kj}\delta_{ik}.
$$
Como $|\delta_{ik}| \leq 2nu + \mathcal{O}(u^2)$,
$$
|e_{ij}| \leq 2nu \sum_{k=1}^{j}|\hat{r}^T_{ik}||\hat{r}_{kj}| + \mathcal{O}(u^2).
$$
Escrevendo como uma equação de matrizes, temos:
$$
A + E = \hat{R}^T\hat{R}.
$$
Introduzindo a desigualdade do erro, obtemos:
$$
|E| \leq 2nu |\hat{R}^T||\hat{R}|+ \mathcal{O}(u^2).
$$
A desigualdade para $\|E\|_F$ segue imediatamente da desigualdade de $|E|$, por que se $|C| \leq |D|$, então $\|C\|_F \leq \|D\|_F$ (conforme o *Exercício 2.7.11*). $\square$



**(b)**  Da definição de traço da matriz e elevando ao quadrado, temos:
$$
\text{tr}^2(B)=(\sum_{i=1}^{n}b_{ii})^2.
$$
Pela *desigualdade de Cauchy-Schwarz*, temos que:
$$
(\sum_{i=1}^{n}b_{ii})^2 \leq \sum_{i=1}^{n}b_{ii}^2.
$$
Agora, tome $S = \sum_{i=1}^{m} \sum_{j=1}^{n} |b_{ij}|^2$ tal que $i \neq j$. Como todos os $|b_{ij}|^2$ são positivos, podemos afirmar que:
$$
(\sum_{i=1}^{n}b_{ii})^2 \leq \sum_{i=1}^{n}b_{ii}^2 + S.
$$
E, como $n > 0$, também é verdade que:
$$
(\sum_{i=1}^{n}b_{ii})^2 \leq n (\sum_{i=1}^{n}b_{ii}^2 + S).
$$
Tirando a raiz quadrada dos dois lados:
$$
|\sum_{i=1}^{n}b_{ii}| \leq \sqrt{n} \sqrt{\sum_{i=1}^{n}b_{ii}^2 + S}.
$$
Mas $\sum_{i=1}^{n}b_{ii}^2 + S$ é exatamente $\sum_{i=1}^{m} \sum_{j=1}^{n} |b_{ij}|^2$ para todo $i,j$. Então:
$$
|\sum_{i=1}^{n}b_{ii}| \leq \sqrt{n} \sqrt{\sum_{i=1}^{m} \sum_{j=1}^{n} |b_{ij}|^2}.
$$
Que, pelas definições de traço e norma de Frobenius, se torna:
$$
|\text{tr}(B)| \leq \sqrt{n} \|B\|_F. \ \ \ \ \ \ \ \ \ \ \ \ \square
$$
**(c)** Podemos escrever os elementos de $A + E = \hat{R}^T\hat{R}$ assim:
$$
a_{ij} + e_{ij} = \sum_{k=1}^{j}\hat{r}_{ki}\hat{r}_{kj}.
$$
Como o traço só soma os elementos da diagonal, vamos analisar os elementos $a_{ii} + e_{ii}$:
$$
a_{ii} + e_{ii} = \sum_{k=1}^{i}\hat{r}_{ki}\hat{r}_{ki} = \sum_{k=1}^{i}\hat{r}^2_{ki}.
$$
Somando esses elementos temos:
$$
\text{tr}(A + E) = \sum_{i=1}^{n} \sum_{k=1}^{i}\hat{r}^2_{ki}.
$$
Ou seja, o traço de $A+E$ é a soma dos quadrados dos elementos de $\hat{R}$. Agora note como é a forma da norma de Frobenius da matriz $\hat{R}$:
$$
\|\hat{R}\|_F = \sqrt{\sum_{i=1}^{n} \sum_{k=1}^{i}\hat{r}^2_{ki}}.
$$
Portanto:
$$
\text{tr}(A + E) = \sum_{i=1}^{n} \sum_{k=1}^{i}\hat{r}^2_{ki} = \|\hat{R}\|_F^2. \ \ \ \ \ \ \ \square 
$$

**(d)** Do *item (a)*, obtemos:
$$
\|E\|_F \leq 2nu \|\hat{R}\|_F^2+ \mathcal{O}(u^2).
$$
Substituindo $\|\hat{R}\|^2_{F} \leq \sqrt{n} (\|A\|_F+\|E\|_F)$:
$$
\|E\|_F \leq 2nu (n^{1/2} (\|A\|_F+\|E\|_F)) + \mathcal{O}(u^2) = 2n^{2/3}u(\|A\|_F+\|E\|_F) + \mathcal{O}(u^2).
$$
Aplicando a distributiva:
$$
\|E\|_F \leq 2n^{2/3}u\|A\|_F + 2n^{2/3}u\|E\|_F + \mathcal{O}(u^2).
$$
Isolando $\|E\|_F$  do lado esquerdo da desigualdade:
$$
(1 - 2n^{2/3}u)\|E\|_F \leq 2n^{2/3}u\|A\|_F + \mathcal{O}(u^2).
$$
Se $2n^{3/2}u<1$, então:
$$
\|E\|_F \leq \frac{2n^{2/3}u}{1 - 2n^{2/3}u}\|A\|_F + \mathcal{O}(u^2).\ \ \ \ \ \ \ \square
$$


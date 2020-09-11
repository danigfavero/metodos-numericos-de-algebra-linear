<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


# Exercício Programa 1 - MAC0300
## Produto interno, norma euclidiana, e produto envolvendo matrizes e vetores

Daniela Gonzalez Favero - 10277443 - 13/09/2020



### 1.  Evitando overflows desnecessários na implementação da Norma Euclidiana

Para calcular a norma euclidiana de um vetor $x$ de tamanho $n$, é necessário fazer:
$$
||x||_2 = \sqrt{\sum_{i=1}^{n}x_i^2}
$$
No entanto, elevar números muito grandes ao quadrado pode gerar overflow e prejudicar a conta no momento de tirar a raiz quadrada da soma dos quadrados. Para resolvermos isso, usamos o fato de que:
$$
||x||_2 = \sqrt{\sum_{i=1}^{n}x_i^2} = \sqrt{\sum_{i=1}^{n}(a\frac{x_i}{a})^2}
= \sqrt{a^2\sum_{i=1}^{n}(\frac{x_i}{a})^2} = |a|\sqrt{\sum_{i=1}^{n}(\frac{x_i}{a})^2}
$$
Para qualquer $a\neq0$. Vamos então usar $a=max(x)$ e dividir o vetor todo por esse número. Deste modo, o maior elemento de $x$ será $1$, evitando overflows desnecessários.

**Experimentos:**

Vamos comparar o resultado de duas funções que calculam a norma: `naive_euclidean_norm()`, que calcula sem truques, e `euclidean_norm()`, que usa  o truque de dividir pelo máximo: 

| Vetor de entrada | `naive_euclidean_norm()` | `euclidean_norm()` |
| ---------------- | ------------------------ | ------------------ |
|                  |                          |                    |
|                  |                          |                    |
|                  |                          |                    |

### 2. Comparação do tempo de execução do algoritmo caso o acesso aos elementos da matriz não seja feita da forma correta no Produto Matriz-vetor

Apesar do produto matriz-vetor ser conhecidamente $\mathcal{O}(nm)$, o acesso à memória em diferentes linguagens pode deixar o programa mais devagar por causa de *pagefaults* (acesso em regiões distantes da memória que fazem o programa trazer para a cache alguma informação da memória principal). Em *Fortran*, as matrizes são acessadas por colunas, portanto seria bom percorrermos matrizes de coluna em coluna.

Para que isso funcione na multiplicação, basta inverter a ordem dos laços que percorrem a matriz.

**Experimentos:**

Vamos comparar o tempo levado por duas subrotinas que multiplicam uma matriz por um vetor: `naive_matrixvector()`,  que percorre a matriz de forma orientada a linha, e `matrixvector()`, que percorre a matriz de modo orientado a coluna: 

| Dimensões da matriz | `naive_matrixvector()` | `nmatrixvector()` |
| ------------------- | ---------------------- | ----------------- |
|                     |                        |                   |
|                     |                        |                   |
|                     |                        |                   |

(Por simplicidade, os experimentos foram feitos apenas com matrizes quadradas)

### 3. Comparação do tempo de execução do algoritmo caso o acesso aos elementos da matriz não seja feita da forma correta no Multiplicação de Matrizes

Apesar da multiplicação entre matrizes ser conhecidamente $\mathcal{O}(nmp)$, o acesso à memória em diferentes linguagens pode deixar o programa mais devagar por causa de *pagefaults*, como comentado no exercício anterior.

Novamente, vamos inverter a ordem dos laços que percorrem a matriz.

**Experimentos:**

Vamos comparar o tempo levado por duas subrotinas que multiplicam matrizes: `naive_matrixmatrix()`,  que percorre as matrizes de forma orientada a linha, e `matrixmatrix()`, que percorre as matrizes de modo orientado a coluna: 

| Dimensões da matriz | `naive_matrixmatrix()` | `nmatrixmatrix()` |
| ------------------- | ---------------------- | ----------------- |
|                     |                        |                   |
|                     |                        |                   |
|                     |                        |                   |

(Por simplicidade, os experimentos foram feitos apenas com matrizes quadradas)

### 
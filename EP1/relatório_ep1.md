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

| Elementos do vetor de entrada | `naive_euclidean_norm()`            | `euclidean_norm()`                  |
| ----------------------------- | ----------------------------------- | ----------------------------------- |
| $10^{100}$                    | 3.1622776601683802$\times 10^{100}$ | 3.1622776601683802$\times 10^{100}$ |
| $10^{200}$                    | Infinity                            | 3.1622776601683807$\times 10^{200}$ |
| $10^{300}$                    | Infinity                            | 3.1622776601683819$\times 10^{200}$ |
| $10^{400}$                    | Infinity                            | Infinity                            |

(Por simplicidade, os experimentos foram feitos com vetores de tamanho 10, com todos os elementos iguais)

Note como o limite do cálculo da norma *naive* é $10^{200}$, enquanto que para a outra função é $10^{400}$. 

### 2. Comparação do tempo de execução do algoritmo caso o acesso aos elementos da matriz não seja feita da forma correta no Produto Matriz-vetor

Apesar do produto matriz-vetor ser $\mathcal{O}(nm)$, o acesso à memória em diferentes linguagens pode deixar o programa mais devagar por causa de *pagefaults* (acesso em regiões distantes da memória que fazem o programa trazer para a *cache* alguma informação da memória principal). Em *Fortran*, as matrizes são acessadas por colunas, portanto seria bom percorrermos matrizes de coluna em coluna.

Para que isso funcione na multiplicação, basta inverter a ordem dos laços que percorrem a matriz.

**Experimentos:**

Vamos comparar o tempo levado por duas sub-rotinas que multiplicam uma matriz por um vetor: `naive_matrixvector()`,  que percorre a matriz de forma orientada a linha, e `matrixvector()`, que percorre a matriz de modo orientado a coluna: 

| Dimensões da matriz | `naive_matrixvector()`             | `nmatrixvector()`                  |
| ------------------- | ---------------------------------- | ---------------------------------- |
| 20$\times$20        | 3.0000000000000729$\times 10^{-6}$ | 2.9999999999999645$\times 10^{-6}$ |
| 200$\times$200      | 2.2400000000000002$\times 10^{-4}$ | 2.1199999999999995$\times 10^{-4}$ |
| 2000$\times$2000    | 2.5766000000000004$\times 10^{-2}$ | 1.1729999999999997$\times 10^{-2}$ |
| 20000$\times$20000  | 10.186771999999999                 | 1.0217460000000003                 |

(Por simplicidade, os experimentos foram feitos apenas com matrizes quadradas)

Note como a diferença de tempo começa pequena, depois parte para metade do tempo e em 20000x20000 a implementação *naive* leva 10 vezes o tempo da outra sub-rotina.

### 3. Comparação do tempo de execução do algoritmo caso o acesso aos elementos da matriz não seja feita da forma correta no Multiplicação de Matrizes

Apesar da multiplicação entre matrizes ser $\mathcal{O}(nmp)$, o acesso à memória em diferentes linguagens pode deixar o programa mais devagar por causa de *pagefaults*, como comentado no exercício anterior.

Novamente, vamos inverter a ordem dos laços que percorrem a matriz.

**Experimentos:**

Vamos comparar o tempo levado por duas sub-rotinas que multiplicam matrizes: `naive_matrixmatrix()`,  que percorre as matrizes de forma orientada a linha, e `matrixmatrix()`, que percorre as matrizes de modo orientado a coluna: 

| Dimensões das matrizes | `naive_matrixmatrix()`             | `nmatrixmatrix()`                  |
| ---------------------- | ---------------------------------- | ---------------------------------- |
| 10$\times$10           | 5.9999999999999290$\times 10^{-6}$ | 5.0000000000000131$\times 10^{-6}$ |
| 100$\times$100         | 4.0819999999999997$\times 10^{-3}$ | 4.2640000000000004$\times 10^{-3}$ |
| 1000$\times$1000       | 11.057141999999999                 | 4.6807420000000004                 |
| 2000$\times$2000       | 110.65318400000000                 | 40.111935000000003                 |

(Por simplicidade, os experimentos foram feitos apenas com matrizes quadradas)

Como no exercício anterior, a diferença de tempo começa irrisório, mas para matriz de tamanho 1000x1000 e 2000x2000, a implementação *naive* leva quase 3 vezes o tempo que a outra sub-rotina.

### 
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


# Lista 2 - MAC0300

Daniela Gonzalez Favero - 10277443 - 11/09/2020

**6.4**  

Queremos saber qual é o maior número $x$ tal que $round(1+x) = 1$, portanto precisamos olhar para o tamanho da mantissa (afinal o expoente já estará determinado pelo 1). Para que $x$ não caiba e seja arredondado (pelo *round to nearest*) para 0, é necessário que o dígito 1 apareça somente uma casa depois da última representada.

No formato single, há 23 bits para representar o número, portanto $x = 2^{-24}$. Já no formato double, há 52 bits para representar o número, portanto $x = 2^{-53}$.



**6.10**  

Sem *guard bits*:
$$
(\space 1.00000000000000000000000 \space)_2 \times 2^0 \\
- (\space 0.00000000000000000000000\space)_2 \times 2^{0} \\
= (\space 1.00000000000000000000000 \space)_2 \times 2^0
$$
Com 1 *guard bit*:
$$
(\space 1.00000000000000000000000 \space)_2 \times 2^0 \\
- (\space 0.00000000000000000000000|1\space)_2 \times 2^{0} \\
= (\space 0.1111111111111111111111|0 \space)_2 \times 2^0 \\
Normalize: (\space1.1111111111111111111110 \space) \times 2^{-1}
$$


Com 2 *guard bits*:
$$
(\space 1.00000000000000000000000 \space)_2 \times 2^0 \\
- (\space 0.00000000000000000000000|10 \space)_2 \times 2^{0} \\
= (\space 0.1111111111111111111111|01 \space)_2 \times 2^0 \\
Normalize: (\space1.1111111111111111111110|1 \space) \times 2^{-1} \\
Round\space to\space Nearest: (\space 1.1111111111111111111111 \space)_2 \times 2^{-1}
$$
Com 2 *guard bits* e 1 *sticky bit*:
$$
(\space 1.00000000000000000000000 \space)_2 \times 2^0 \\
- (\space 0.00000000000000000000000|100 \space)_2 \times 2^{0} \\
= (\space 0.1111111111111111111111|010 \space)_2 \times 2^0 \\
Normalize: (\space1.1111111111111111111110|10 \space) \times 2^{-1} \\
Round\space to\space Nearest: (\space 1.1111111111111111111111 \space)_2 \times 2^{-1}
$$


**7.5**  

Sim, isso ocorre quando $a=+\infty$ e $b=-\infty$.

$a=b \implies +\infty = -\infty$ é uma afirmação FALSA.

$\frac{1}{a}=\frac{1}{b} \implies \frac{1}{+\infty}=\frac{1}{-\infty} \implies +0 = -0$ é uma afirmação VERDADEIRA.



  
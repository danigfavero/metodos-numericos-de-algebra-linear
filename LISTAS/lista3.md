<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>


## Lista 3 - MAC0300

Daniela Gonzalez Favero - 10277443 - 20/09/2020

Exercícios extraídos do livro *"Fundamentals of Matrix Computations" de David S. Watkins (John Wiley & Sons, 1991)*.

**1.2.4**    

Se $A^{-1}$ existe, então:
$$
AA^{-1} = A^{-1}A = I​
$$
Resolvendo a equação:
$$
Ay = 0\\
A^{-1}Ay = A^{-1}0\\
Iy = 0\\
y = 0
$$
Portanto não há $y\neq0$ que satisfaça $Ay=0$. $\square$ 

**1.3.7**

```pseudocode
k = b1
while b(k) = 0
	if g(k,k) = 0, set error flag, exit
	k ← k + 1
    
for i=k+1,...,n
    for j=1,...,i-1
    	b(i) ← b(i) - g(i,j)b(j)
    if g(i,i) = 0, set error flag, exit
    b(i) ← b(i)/g(i,i)
```

**1.3.15** 

```pseudocode
for i=n,n-1,...,2,1
    for j=1,...,i-1
    	b(i) ← b(i) - g(i,j)b(j)
    if g(i,i) = 0, set error flag, exit
    b(i) ← b(i)/g(i,i)
```




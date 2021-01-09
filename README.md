# MAC0300 — Métodos Numéricos de Álgebra Linear

Trabalhos e exercícios da matéria MAC0300, ministrada pelo professor Ernesto G. Birgin no segundo semestre de 2020.

## Exercícios programa
Os exercícios-programa foram feitos *Fortran* (usando o compilador *gfortran*).
  
### EP1: Produto interno, norma euclidiana, e produto envolvendo matrizes e vetores
O objetivo deste exercício programa foi estudar e desenvolver algoritmos eficientes para fazer operações básicas com matrizes. Foi necessário encontrar uma forma de evitar overflows desnecessários e acesso os elementos das matrizes de forma a levar em conta o uso de cache.
  
### EP2: Resolução de sistemas de equações lineares
Este exercício programa teve como objetivo estudar e desenvolver algoritmos para resolver sistemas de equações lineares levando em consideração as estruturas de dados disponíveis na plataforma onde serão implementados.  
Foram implementadas funções que executavam a decomposição de Cholesky, back-substitution, forward-substitution e decomposição LU (todas nas duas orientações possíveis: a coluna e a linha).
  
### EP3: Matrizes ortogonais e o problema de quadrados mínimos
Este exercício programa teve como objetivo resolver problemas de quadrados mínimos, de modo que foi necessário pensar em formas razoáveis de gerar os dados dos problemas. Também é mostrada graficamente a solução obtida, com auxílio de um programa em *octave*.
  
### EP4: Métodos iterativos para sistemas lineares — Gradientes Conjugados
Este exercício programa teve como objetivo estudar métodos iterativos para sistemas lineares, implementando o método de gradientes conjugados.
  
## Listas
Os exercícios das 11 primeiras listas foram tirados dos livros *"Fundamentals of Matrix Computations" de David S. Watkins (John Wiley & Sons, 1991)* e *"Numerical Computing with IEEE Floating Point Arithmetic" de Michael L. Overton (SIAM, Philadelphia, 2001)*. A lista 12 é um mini exercício-programa em *octave* para implementar **Armazenamento de imagens usando SVD**.
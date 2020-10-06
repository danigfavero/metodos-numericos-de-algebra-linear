// Gerador de sistemas de equacoes lineares Ax=b de dimensao n
// com solucao x tal que x_i = 1+i%(n/100), i=0, ..., n-1.

// Para gerar as os arquivos a1.dat, a2.dat, ..., a7.dat escolha
// esses nomes com dimensoes 100, 200, ..., 700, respectivamente.

// Para gerar o arquivo a8.dat subsitua o laco

//  for (i=0; i<n; i++)
//    for (j=0; j<n; j++)
//      fprintf(fp,"\n%3d %3d % .20e",i,j,M[i][j]);

// por

//  for (i=0; i<n; i++)
//    if (i==n/2)
//      for (j=0; j<n; j++)
//        fprintf(fp,"\n%3d %3d % .20e",i,j,M[0][j]);
//    else
//      for (j=0; j<n; j++)
//        fprintf(fp,"\n%3d %3d % .20e",i,j,M[i][j]);

// e para gerar o arquivo a9.dat troque o "n/2" por "n-1".
// Em ambos casos escolha n=700. O que estara fazendo sera gerar
// matrizes cujas linhas n/2 e n-1, respectivamente, serao copia
// da linha 0, i.e., matrizes singulares.

#include <stdio.h>
#include <stdlib.h>
#define nmax 700

int main()
{
  int n,i,j,k;
  double M[nmax][nmax],b[nmax],x[nmax];
  FILE *fp;
  char filename[100];

  // Dimensao.

  printf("\nn= ");
  scanf("%d",&n);

  // Arquivo de saida.

  printf("\nOutput file name= ");
  scanf("%s", filename);

  // Gera matriz aleatoria M com elementos entre -5 e 5.

  srand(853);

  for (i=0; i<n; i++)
    for (j=0; j<n; j++)
      M[i][j]= 10*((float)rand()/RAND_MAX-0.5);

  // Constroe a solucao descrita acima.

  for (i=0; i<n; i++)
    x[i]= 1+i%(n/100);

  // Calcula b =  A x (de novo, veja o produto orientado a linha).

  for (i=0; i<n; i++)
    {
    b[i]= 0;
    for(j=0; j<n; j++)
      b[i]+= M[i][j]*x[j];
    }

  // Grava o arquivo de saida com n, M e b.

  fp= fopen(filename,"wt");

  fprintf(fp,"%d",n);

  for (i=0; i<n; i++)
    for (j=0; j<n; j++)
      fprintf(fp,"\n%3d %3d % .20e",i,j,M[i][j]);

  for (i=0; i<n; i++)
      fprintf(fp,"\n%3d % .20e",i,b[i]);

  fclose(fp);

  return 0;
}
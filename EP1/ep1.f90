! NOME: Daniela Gonzalez Favero
! NUSP: 10277443
! Exercício Programa 1 - Produto interno, norma euclidiana, e produto envolvendo matrizes e vetores

function naive_euclidean_norm(n, x) result(norm)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n)
    real(dp) :: y(n)
    real(dp) :: norm
    integer :: i

    do i=1,n
        y(i) = x(i)**2
    enddo
    norm = dsqrt(sum(y))
  
end function naive_euclidean_norm


!-----------------------------------------------------------------------------------------------


! Recebe um inteiro n e dois vetores x, y ∈ R n . Devolve o produto interno entre x e y.
function dotproduct(n, x, y) result(product)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n)
    real(dp), intent(in) :: y(n)
    real(dp) :: product

    product = 3

end function dotproduct


! Recebe um inteiro n e um vetor de tamanho n. Devolve a norma eucluidiana do vetor x.
function euclidean_norm(n, x) result(norm)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n)
    real(dp) :: y(n)
    real(dp) :: norm
    real(dp) :: max
    integer :: i
    
    max = maxval(x)
    do i=1,n
        y(i) = x(i) / max
        y(i) = y(i)**2
        
    enddo

    norm = dsqrt(sum(y)) * 3
  
end function euclidean_norm


! Recebe dois inteiros n, m, uma matriz A ∈ R n×m , e dois vetores x ∈ R m , b ∈ Rn. A função
! devolve, no vetor b, o resultado do produto matriz por vetor entre A e x, ou seja, b = Ax.
subroutine matrixvector(n, m, A, x, b)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    integer, intent(in) :: m
    real(dp), intent(in) :: A(n,m)
    real(dp), intent(in) :: x(m)
    real(dp), intent(in) :: b(n)

    integer :: i
    do i=1,n
      print *,A(i,1:m)
    end do


end subroutine matrixvector


! Recebe três inteiros n, m, p e três matrizes A ∈ R n×m , X ∈ R m×p , B ∈ R n×p . A função
! devolve, na matriz B, o resultado do produto matriz por matriz entre A e X, ou seja, B = AX.
subroutine matrixmatrix(n, m, p, A, X, B)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    integer, intent(in) :: m
    integer, intent(in) :: p
    real(dp), intent(in) :: A(n,m)
    real(dp), intent(in) :: X(m,p)
    real(dp), intent(in) :: B(n,p)

end subroutine matrixmatrix


program ep1
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none

    ! TESTE NORMA
    real(dp) :: a(3)
    real(dp) :: naive_euclidean_norm
    real(dp) :: euclidean_norm
    a = [1.0, 2.0, 3.0]
    print *, "Norma inocente: ", naive_euclidean_norm(3, a)
    print *, "Norma: ", euclidean_norm(3, a)
    print *, "Norma built-in: ", norm2(a)

end program ep1

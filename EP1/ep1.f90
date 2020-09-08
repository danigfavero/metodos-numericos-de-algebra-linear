! NOME: Daniela Gonzalez Favero
! NUSP: 10277443
! Exercício Programa 1 - Produto interno, norma euclidiana, e produto envolvendo matrizes e vetores


! Recebe um inteiro n e dois vetores x, y ∈ R n . Devolve o produto interno entre x e y.
function euclidean_norm(n, x) result(norm)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n)
    real :: norm
  
    norm = sqrt(sum(x**2))
  
end function euclidean_norm


! Recebe um inteiro n e um vetor x ∈ R n . Devolve a norma eucluidiana do vetor x.
function dotproduct(n, x, y) result(product)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n)
    real(dp), intent(in) :: y(n)
    real(dp) :: product

    product = 3

end function dotproduct


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

    ! TESTING
    ! integer :: n
    ! n = 10
    ! real(dp) :: array1(n) 
    ! real(dp) :: array2(n) 
    ! array1 = [(i,i=1,10)]
    ! array1(:) = 0 
    ! print *, dot_product(n, array1, array2)

end program ep1

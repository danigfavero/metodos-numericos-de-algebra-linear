! NOME: Daniela Gonzalez Favero
! NUSP: 10277443
! Exercício Programa 1 - Produto interno, norma euclidiana, e produto 
! envolvendo matrizes e vetores


! Recebe um inteiro n e dois vetores x, y de tamanho n. Devolve o produto
! interno entre x e y.
function dotproduct(n, x, y) result(product)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n)
    real(dp), intent(in) :: y(n)
    real(dp) :: product

    integer :: i
    real(dp) :: z(n)

    do i=1,n
        z(i) = x(i) * y(i)
    enddo

    product = sum(z)

end function dotproduct


! Recebe um inteiro n e um vetor de tamanho n. Devolve a norma euclidiana do
! vetor x.
function euclidean_norm(n, x) result(norm)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n)
    real(dp) :: norm

    real(dp) :: max
    integer :: i
    real(dp) :: y(n)

    max = maxval(x)
    do i=1,n
        y(i) = x(i) / max
        y(i) = y(i)**2
    enddo

    norm = dsqrt(sum(y)) * 3

end function euclidean_norm


! Recebe dois inteiros n, m, uma matriz A (nXm) e dois vetores x de tamanho m,
! b de tamanho n. A função devolve, no vetor b, o resultado do produto matriz
! por vetor entre A e x, ou seja, b = Ax.
subroutine matrixvector(n, m, A, x, b)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    integer, intent(in) :: m
    real(dp), intent(in) :: A(n,m)
    real(dp), intent(in) :: x(m)
    real(dp) :: b(n)

    integer :: i
    integer :: j
    do i=1,n
        do j=1,m
            b(j) = b(j) + A(j,i) * x(i)
        enddo
    enddo

end subroutine matrixvector


! Recebe três inteiros n, m, p e três matrizes A (nXm) , X (mXp) e B (nXp). A
! função devolve, na matriz B, o resultado do produto matriz por matriz entre A
! e X, ou seja, B = AX.
subroutine matrixmatrix(n, m, p, A, X, B)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    integer, intent(in) :: m
    integer, intent(in) :: p
    real(dp), intent(in) :: A(n,m)
    real(dp), intent(in) :: X(m,p)
    real(dp) :: B(n,p)

end subroutine matrixmatrix

! -----------------------------------------------------------------------------

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

subroutine naive_matrixvector(n, m, A, x, b)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    integer, intent(in) :: m
    real(dp), intent(in) :: A(n,m)
    real(dp), intent(in) :: x(m)
    real(dp) :: b(n)

    integer :: i
    integer :: j
    do i=1,n
        b(i) = 0.0
        do j=1,m
            b(i) = b(i) + A(i,j) * x(j)
        enddo
    enddo

end subroutine naive_matrixvector


program ep1
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    real(dp) :: v(3)
    real(dp) :: naive_euclidean_norm
    real(dp) :: euclidean_norm
    real(dp) :: dotproduct
    real(dp), allocatable :: M(:,:)
    real(dp), allocatable :: q(:)
    real(dp), allocatable :: u(:)
    real(dp), allocatable :: N(:,:)
    real(dp), allocatable :: O(:,:)
    integer :: i
    integer :: j
    integer :: meunumero
    real(kind=8)::start,finish

    ! TESTE NORMA
    v = [1.0, 2.0, 3.0]
    print *, "Norma inocente: ", naive_euclidean_norm(3, v)
    print *, "Norma: ", euclidean_norm(3, v)
    print *, "Norma built-in: ", norm2(v)

    print *, ""

    ! TESTE PRODUTO INTERNO
    print *, "Produto interno: ", dotproduct(3, v, v)
    print *, "Produto interno built-in: ", dot_product(v, v)

    print *, ""

    ! TESTE MATRIZ VETOR
    meunumero = 20000
    allocate(M(meunumero,meunumero))
    allocate(q(meunumero))
    allocate(u(meunumero))
    do i=1,meunumero
        q(i) = i * 3.1
        do j=1,meunumero
            M(i,j) = i+j * 2.7
        enddo
    enddo

    call cpu_time(start)
    call matrixvector(meunumero, meunumero, M, q, u)
    call cpu_time(finish)
    print *, "Produto matriz vetor: ", finish-start

    call cpu_time(start)
    call naive_matrixvector(meunumero, meunumero, M, q, u)
    call cpu_time(finish)
    print *, "Produto matriz vetor naive: ", finish-start

    call cpu_time(start)
    u = matmul(M, q)
    call cpu_time(finish)
    print *, "Produto matriz vetor built-in: ", finish-start

    deallocate(M)
    deallocate(q)
    deallocate(u)

    print *, ""

    ! TESTE MATRIZ MATRIZ
    ! meunumero = 20000
    ! allocate(M(meunumero,meunumero))
    ! allocate(N(meunumero,meunumero))
    ! allocate(O(meunumero,meunumero))
    ! do i=1,meunumero
    !     q(i) = i * 3.1
    !     do j=1,meunumero
    !         M(i,j) = i+j * 2.7
    !     enddo
    ! enddo
    ! call matrixmatrix(3, 3, 3, M, N, O)
    ! print *, "Multiplicação de matrizes: ", O
    ! print *, "Multiplicação de matrizes built-in: ", matmul(M, N)


end program ep1

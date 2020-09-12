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
    real(dp), intent(in) :: x(n), y(n)
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
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n)
    real(dp) :: norm

    real(dp) :: max
    integer :: i
    real(dp) :: y(n)

    max = maxval(x)
    if (max == 0) then
        max = 1
    endif

    do i=1,n
        y(i) = (x(i) / max)**2
    enddo

    norm = dsqrt(sum(y)) * abs(max)

end function euclidean_norm


! Recebe dois inteiros n, m, uma matriz A (nXm) e dois vetores x de tamanho m,
! b de tamanho n. A função devolve, no vetor b, o resultado do produto matriz
! por vetor entre A e x, ou seja, b = Ax.
subroutine matrixvector(n, m, A, x, b)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n, m
    real(dp), intent(in) :: A(n,m)
    real(dp), intent(in) :: x(m)
    real(dp) :: b(n)

    integer :: i
    integer :: j
    do i=1,n
        b(i) = 0
    enddo

    do j=1,m
        do i=1,n
            b(i) = b(i) + A(i,j) * x(j)
        enddo
    enddo

end subroutine matrixvector


! Recebe três inteiros n, m, p e três matrizes A (nXm) , X (mXp) e B (nXp). A
! função devolve, na matriz B, o resultado do produto matriz por matriz entre A
! e X, ou seja, B = AX.
subroutine matrixmatrix(n, m, p, A, X, B)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n, m, p
    real(dp), intent(in) :: A(n,m), X(m,p)
    real(dp) :: B(n,p)

    integer :: i, j, k

    do i=1,n
        do j=1,p
            B(i,j) = 0
        enddo
    enddo

    do k=1,p
        do j=1,m
            do i=1,n
                B(i,k) = B(i,k) + A(i,j) * X(j,k)
            enddo
        enddo
    enddo

end subroutine matrixmatrix


! ------------------------------------TESTES-----------------------------------
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
    integer, intent(in) :: n, m
    real(dp), intent(in) :: A(n,m)
    real(dp), intent(in) :: x(m)
    real(dp) :: b(n)

    integer :: i, j

    do i=1,n
        b(i) = 0.0
        do j=1,m
            b(i) = b(i) + A(i,j) * x(j)
        enddo
    enddo

end subroutine naive_matrixvector


subroutine naive_matrixmatrix(n, m, p, A, X, B)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n, m, p
    real(dp), intent(in) :: A(n,m), X(m,p)
    real(dp) :: B(n,p)

    integer :: i, j, k

    do i=1,n
        do j=1,m
            B(i,j) = 0
            do k=1,p
                B(i,k) = B(i,k) + A(i,j) * X(j,k)
            enddo
        enddo
    enddo

end subroutine naive_matrixmatrix


program ep1
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    real(dp) :: naive_euclidean_norm, euclidean_norm
    real(dp), allocatable :: v(:), q(:), u(:)
    real(dp), allocatable :: M(:,:), N(:,:), O(:,:)
    real(kind=8)::start, finish
    integer :: i, j, l, meunumero

    ! TESTE NORMA
    allocate(v(10))
    do i=1,4
        do j=1,10
            v(j) = dble(10)**(i*100)
        enddo
        print *, "Expoente: ", i*100
        print *, "Norma inocente: ", naive_euclidean_norm(10, v)
        print *, "Norma: ", euclidean_norm(10, v)
    enddo
    deallocate(v)

    print *, ""

    ! TESTE MATRIZ VETOR
    do l=1,4
        meunumero = 2*10**l
        print *, meunumero
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

        deallocate(q)
        deallocate(u)
        deallocate(M)
        print *, ""
    enddo

    ! TESTE MATRIZ MATRIZ
    do l=1,4
        if (l == 4) then
            meunumero = 2*10**(l-1)
        else 
            meunumero = 1*10**l
        endif

        print *, meunumero
        allocate(M(meunumero,meunumero))
        allocate(N(meunumero,meunumero))
        allocate(O(meunumero,meunumero))
        do i=1,meunumero
            do j=1,meunumero
                M(i,j) = i+j * 3.3
                N(i,j) = i-j * 1.4
            enddo
        enddo

        call cpu_time(start)
        call naive_matrixmatrix(meunumero, meunumero, meunumero, M, N, O)
        call cpu_time(finish)
        print *, "Multiplicação de matrizes naive: ", finish-start

        call cpu_time(start)
        call matrixmatrix(meunumero, meunumero, meunumero, M, N, O)
        call cpu_time(finish)
        print *, "Multiplicação de matrizes: ", finish-start

        deallocate(M)
        deallocate(N)
        deallocate(O)
    enddo

end program ep1

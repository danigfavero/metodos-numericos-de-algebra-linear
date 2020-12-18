! NOME: Daniela Gonzalez Favero
! NUSP: 10277443
! Exercício Programa 4 - Gradientes Conjugados

! Recebe um inteiro n e dois vetores x, y de tamanho n. Devolve o produto
! interno entre x e y.
function dotproduct(n, x, y) result(product)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: x(n), y(n)
    real(dp) :: product
    integer :: i

    product = 0
    do i=1,n
        product = product + x(i) * y(i)
    enddo

end function dotproduct

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

! Seja A (mXm) simétrica e definida positiva, a subrotina resolve o sistema de
! equações não-singular Ax=b, utilizando o método de gradientes conjugados.
subroutine cg(m, A, b, x)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: m
    real(dp) :: A(m,m), b(m)
    real(dp) :: x(m), p(m), Ap(m)
    real(dp) :: alpha, beta, bTb, prev_bTb, dotproduct
    integer :: i, iter

    do i=1,m
        x(m) = 0
    enddo
    p = b

    iter = 0
    bTb = dotproduct(m, b, b)
    do while (iter < 10) ! condição de parada provisória
        call matrixvector(m, m, A, p, Ap)
        alpha = bTb / dotproduct(m, p, Ap)

        do i=1,m
            x(i) = x(i) + (alpha * p(i))
        enddo

        do i=1,m
            b(i) = b(i) - (alpha * Ap(i))
        enddo

        prev_bTb = bTb
        bTb = dotproduct(m, b, b)
        beta = bTb / prev_bTb

        do i=1,m
            p(i) = b(i) + (beta * p(i))
        enddo

        iter = iter + 1

    enddo


end subroutine cg

program ep4
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer :: m, i, j
    real(dp), allocatable :: A(:,:), b(:), x(:)
    real(dp) :: aij, bi

    read (*,*) m

    allocate(A(m,m))
    do i=1,m
        do j=1,m
            read(*,*) aij
            A(i,j) = aij
        enddo
    enddo

    allocate(b(m))
    allocate(x(m))
    do i=1,m
        read(*,*) bi
        b(i) = bi
        x(i) = 0
    enddo

    call cg(m, A, b, x)

    print *, x

    deallocate(A)
    deallocate(b)
    deallocate(x)

end program ep4
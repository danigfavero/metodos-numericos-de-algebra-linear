! NOME: Daniela Gonzalez Favero
! NUSP: 10277443
! Exercício Programa 3 - Matrizes ortogonais e o problema de quadrados mínimos

! Recebe um inteiro n, uma matriz triangular A (nXn), um vetor b (n). A função
! devolve, no próprio b, a solução do sistema triangular desejado, 0 se o
! sistema foi calculado com sucesso e -1 se a matriz A for singular.
function backcol(n, A, b) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: A(n,n)
    real(dp):: b(n)
    integer :: sucesso, j, i

    sucesso = 0
    do j=1,n
        if (A(j,j) == 0) then
            sucesso = -1
            exit
        endif

        b(j) =  b(j)/A(j,j)

        do i=n,j+1,-1
            b(i) = b(i) - A(i,j)*b(j)
        enddo 
    enddo

end function backcol

! Dada uma matriz A de dimensão nXm, o algoritmo calcula tau, gamma e u tais
! que Q=(I-gamma*u*u^T) é um refletor para a coluna k de A. Se a coluna k é
! zero, gamma = 0, dando Q=I. Caso contrário, gamma e u são produzidos, e u é
! armazenada na coluna k. Como u(k) é 1, armazenamos tau em A(k,k).
function reflector(A, n, m, k, beta, tau) result(gamma)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    real(dp) :: A(n,m), beta, gamma, tau
    integer :: n, m, k, i

    beta = 0
    do i=k,n
        if (abs(A(i,k)) > beta) then
            beta = abs(A(i,k))
        endif
    enddo

    if (beta == 0) then ! Q = I
        gamma = 0
    else
        tau = 0
        do i=k,n
            A(i,k) = A(i,k)/beta
            tau = tau + A(i,k)**2
        enddo
        tau = dsqrt(tau)

        if (A(k,k) < 0) then
            tau = -tau
        endif

        A(k,k) = tau + A(k,k)
        gamma = A(k,k)/tau
        do i=k+1,n
            A(i,k) = A(i,k)/A(k,k)
        enddo
        tau = tau * beta
        A(k,k) = tau
    endif

end function reflector

subroutine rescale(A, n, m)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n, m
    real(dp) :: max, A(n,m)
    integer :: i, j

    max = 0
    do j=1,m
        do i=1,n 
            if (abs(A(i,j)) > max) then
                max = abs(A(i,j))
            endif
        enddo
    enddo

    do j=1,m
        do i=1,n 
            A(i,j) = A(i,j)/max
        enddo
    enddo

end subroutine rescale

function permutation(A, n, m, k, norms, perm, max_val) result(rank)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n, m
    real(dp) :: max_val, A(n,m), norms(m), eps, aux
    integer :: k, i, j, max, rank, perm(m)

    rank = 1
    eps = 0

    if (k /= 1) then
        do j=k,m
            norms(j) = norms(j) - A(k-1,j)**2
        enddo
    endif

    max = k
    max_val = norms(k)
    do j=k+1,m
        if (norms(j) > max_val) then
            max = j
            max_val = norms(j)
        endif
    enddo

    if (max_val < eps) then
        rank = 0
    else
        perm(k) = max
        if (max /= k) then
            aux = norms(k)
            norms(k) = norms(max)
            norms(max) = aux

            do i=1,n 
                aux = A(i,k)
                A(i,k) = A(i, max)
                A(i, max) = aux
            enddo

        endif

    endif

end function permutation

! se gamma = 0 => A singular
subroutine qr(A, n, m, gammas, perm, max, rank)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n, m
    integer :: k, i, j, perm(m), permutation, rank
    real(dp) :: A(n,m), v(m), gammas(m)
    real(dp) ::tau, beta, norms(m), max
    real(dp) :: reflector

    call rescale(A, n, m)

    ! calcula as normas de todas as colunas da matriz inicial
    do j=1,m
        norms(j) = 0
        do i=1,n 
            norms(j) = norms(j) + A(i,j)**2 
        enddo
    enddo
    
    do k=1,m-1

        if (permutation(A, n, m, k, norms, perm, max) == 0) then
            exit ! posto incompleto
        endif

        gammas(k) = reflector(A, n, m, k, beta, tau)

        ! v^T <- (gamma * u^T) * B
        do j=k+1,m 
            v(j) = 0
            do i=k+1,n
                v(j) = v(j) + (gammas(k) * A(i, k)) * A(i,j)
            enddo
        enddo

        ! B <- B - (u * v^T)
        do j=k+1,m
            do i=k+1,n
                A(i,j) = A(i,j) - (A(i,k) * v(j))
            enddo
        enddo

    enddo

    rank = k

end subroutine qr

! resolve
subroutine leastsquares(n, m, A, b)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n, m
    real(dp) :: A(n,m), b(n)
    integer :: singular, backcol, rank, i, k, perm(m)
    real(dp) :: gammas(m), v, max, aux

    call qr(A, n, m, gammas, perm, max, rank)

    do i=1,n 
        b(i) = b(i)/max
    enddo

    do k=1,rank
        ! v^T <- (gamma * u^T) * b
        v = b(k)

        do i=k+1,n
            v = v + (gammas(k) * A(i, k)) * b(i)
        enddo

        ! b <- b - (u * v^T)
        do i=k+1,n
            b(i) = b(i) - (A(i,k) * v)
        enddo

    enddo

    singular = backcol(m, A, b)

    do i=1,rank
        aux = b(i)
        b(i) = b(perm(i))
        b(perm(i)) = aux
    enddo

end subroutine leastsquares

program ep3
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer :: n, m, i, j
    real(dp), allocatable :: A(:,:)
    real(dp) :: aij

    read (*,*) n, m
    allocate(A(n,m))
    do i=1,n
        do j=1,m
            read(*,*) aij
            A(i,j) = aij
        enddo
    enddo


end program ep3
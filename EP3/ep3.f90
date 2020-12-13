! NOME: Daniela Gonzalez Favero
! NUSP: 10277443
! Exercício Programa 3 - Matrizes ortogonais e o problema de quadrados mínimos


!!!!!!!!!!!!!!!!!!!!!!!!!!!!! FUNÇÕES AUXILIARES !!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Dada uma matriz A de dimensão nXm, a subrotina rescale() reescala toda a
! matriz para evitar overflow, dividindo todos os elementos pelo maior valor
! absoluto dentre os elementos. Ela também devolve o valor máximo da matriz em
! max.
subroutine rescale(A, n, m, max)
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

! Recebe uma matriz A de dimensão nXm, um valor de iteração k-1 e um vetor de
! normas norms contendo as normas das colunas calculadas até a iteração atual.
! Devolve o vetor norms com as normas da iteração k, além do vetor perm que
! guarda as permutações das colunas e se o posto (rank) da matriz é completo
! (1) ou incompleto (0).
function permutation(A, n, m, k, norms, perm) result(rank)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n, m
    real(dp) :: max_val, A(n,m), norms(m), eps, temp
    integer :: k, i, j, max, rank, perm(m)

    rank = 1
    eps = epsilon(eps)

    if (k > 1) then
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
        rank = 0 ! posto incompleto
    else
        perm(k) = max

        if (max /= k) then
            temp = norms(k)
            norms(k) = norms(max)
            norms(max) = temp

            do i=1,n
                temp = A(i,k)
                A(i,k) = A(i, max)
                A(i, max) = temp
            enddo

        endif

    endif

end function permutation

! Dada uma matriz A de dimensão nXm, o valor da iteração atual k e o vetor
! norms com as normas das colunas de A, o algoritmo calcula tau, gamma e u tais
! que Q=(I-gamma*u*u^T) é um refletor para a coluna k de A. Se a coluna k é
! zero, gamma = 0, dando Q=I. Caso contrário, gamma e u são produzidos, e u é
! armazenada na coluna k. Como u(k) é 1, armazenamos -tau em A(k,k).
function reflector(A, n, m, k, norms) result(gamma)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer :: n, m, k, i
    real(dp) :: A(n,m), gamma, tau, norms(m)

    tau = dsqrt(norms(k))
    if (A(k,k) < 0) then
        tau = -tau
    endif

    A(k,k) = tau + A(k,k)
    gamma = A(k,k)/tau

    do i=k+1,n
        A(i,k) = A(i,k)/A(k,k)
    enddo

    A(k,k) = -tau

end function reflector

! Recebe um inteiro n, uma matriz triangular A (nXn), um vetor b (n). A função
! devolve, no próprio b, a solução do sistema triangular desejado, 0 se o
! sistema foi calculado com sucesso e -1 se a matriz A for singular.
function backcol(n, A, b) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: A(n,n)
    real(dp):: b(n), eps
    integer :: sucesso, j, i

    sucesso = 0
    eps = 0.0001

    do j=n,1,-1
        if (A(j,j) < eps .and. A(j,j) > -eps) then
            sucesso = -1
            exit
        endif
        
        b(j) = b(j)/A(j,j)

        do i=j-1,1,-1
            b(i) = b(i) - A(i,j) * b(j)
        enddo

    enddo

end function backcol

!!!!!!!!!!!!!!!!!!! QR DECOMPOSITION & LEAST SQUARES METHOD !!!!!!!!!!!!!!!!!!!

! Dada uma matriz A de dimensão nXm, calcula a decomposição da mesma em QR,
! sendo Q uma matriz ortogonal (armazenada não explicitamente na parte
! triangular inferior) de A e R uma matriz triangular superior armazenada
! também em A. A subrotina também devolve o vetor gammas com ,
! o vetor perm com as permutações realizadas na decomposição, o valor max com o
! elemento máximo da matriz e o valor rank com o posto de A.
subroutine qr(A, n, m, gammas, perm, max, rank)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n, m
    integer :: k, i, j, perm(m), permutation, rank
    real(dp) :: A(n,m), v(m), gammas(m)
    real(dp) :: norms(m), max
    real(dp) :: reflector

    do i=1,m
        perm(i) = i
        v(i) = 0
    enddo

    call rescale(A, n, m, max)

    ! calcula as normas de todas as colunas da matriz inicial
    do j=1,m
        norms(j) = 0
        do i=1,n 
            norms(j) = norms(j) + A(i,j)**2 
        enddo
    enddo

    ! finalmente, a decomposição QR
    do k=1,m-1
        if (permutation(A, n, m, k, norms, perm) == 0) then
            exit ! posto incompleto
        endif

        gammas(k) = reflector(A, n, m, k, norms)

        ! v^T <- (gamma * u^T) * B
        do j=k+1,m
            v(j) = gammas(k) * A(k,j)
            do i=k+1,n
                v(j) = v(j) + (gammas(k) * A(k, j)) * A(i,j)
            enddo
        enddo

        ! B <- B - (u * v^T)
        do j=k+1,m
            A(k,j) = A(k,j) - v(j)
            do i=k+1,n
                A(i,j) = A(i,j) - (A(i,k) * v(j))
            enddo
        enddo

    enddo

    rank = k

end subroutine qr

! Dada uma matriz A de dimensão nXm e um vetor b de dimensão n, a subrotina
! calcula o sistema superdeterminado Ax=b, devolvendo o vetor x em b.
subroutine leastsquares(n, m, A, b)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n, m
    real(dp) :: A(n,m), b(n)
    integer :: singular, backcol, rank, i, k, perm(m)
    real(dp) :: gammas(m), v, max, temp

    call qr(A, n, m, gammas, perm, max, rank)

    do i=1,n
        b(i) = b(i)/max
    enddo

    do k=1,rank
        ! v^T <- (gamma * u^T) * b
        v = b(k)

        do i=k+1,n
            v = v + (A(i, k) * b(i))
        enddo
        b(k) = b(k) - (gammas(k) * v)

        ! b <- b - (u * v^T)
        do i=k+1,n
            b(i) = b(i) - (gammas(k) * v * A(i,k))
        enddo

    enddo

    singular = backcol(rank, A, b)

    do i=1,rank
        temp = b(i)
        b(i) = b(perm(i))
        b(perm(i)) = temp
    enddo

end subroutine leastsquares


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! FUNÇÃO MAIN !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program ep3
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer :: n, m, i, j
    real(dp), allocatable :: A(:,:), b(:)
    real(dp) :: aij, bi
    real(kind=8)::start, finish

    read (*,*) n, m

    allocate(A(n,m))
    do i=1,n
        do j=1,m
            read(*,*) aij
            A(i,j) = aij
        enddo
    enddo

    allocate(b(n))
    do i=1,n
        read(*,*) bi
        b(i) = bi
    enddo

    ! call cpu_time(start)
    call leastsquares(n, m, A, b)
    ! call cpu_time(finish)
    ! print *, finish-start

    do i=1,m
        print *,b(i)
    enddo

    deallocate(A)
    deallocate(b)

end program ep3
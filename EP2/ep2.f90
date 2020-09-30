! NOME: Daniela Gonzalez Favero
! NUSP: 10277443
! Exercício Programa 2 - Resolu̧cão de sistemas de equações lineares

!--------------------- 1 - SISTEMAS DEFINIDOS POSITIVOS ---------------------!
!------------------------ FUNÇÕES ORIENTADAS A COLUNA ------------------------!

! Recebe um inteiro n e uma matriz A (nXn) e devolve, na parte triangular
! inferior da própria A, o fator de Cholesky G. Devolve 0 se G foi calculada
! com sucesso e -1 se a matriz A não for definida positiva.
function cholcol(n, A) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n
    real(dp) :: A(n,n)
    integer :: sucesso, i, k, j

    sucesso = 0
    do i=1,n
        if (A(i,i) <= 0) then
            sucesso = -1
            exit
        endif

        A(i,i) = dsqrt(A(i,i))
        do j=i+1,n
            do k=j,i-1
                A(k,j) = A(k,j) - A(j,i)*A(k,i)
            enddo
        enddo
    enddo

end function cholcol

! Recebe um inteiro n, uma matriz triangular inferior A (nXn) e um vetor b (n)
! e devolve, no próprio b, a solução do sistema triangular inferior Ax=b.
! Devolve 0 se o sistema foi calculado com sucesso e -1 se a matriz A for
! singular.
function forwcol(n, A, b) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: A(n,n)
    real(dp):: b(n)
    integer :: sucesso

    sucesso = -1

end function forwcol

! Recebe um inteiro n, uma matriz triangular A (nXn), um vetor b (n) e um
! inteiro trans que vale 1 se A está transposta, 0 caso contrário. A função
! devolve, no próprio b, a solução do sistema triangular desejado, 0 se o
! sistema foi calculado com sucesso e -1 se a matriz A for singular.
function backcol(n, A, b, trans) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n, trans
    real(dp), intent(in) :: A(n,n)
    real(dp):: b(n)
    integer :: sucesso

    sucesso = -1

end function backcol

!------------------------- FUNÇÕES ORIENTADAS A LINHA -------------------------!

! Recebe um inteiro n e uma matriz A (nXn) e devolve, na parte triangular
! inferior da própria A, o fator de Cholesky G. Devolve 0 se G foi calculada
! com sucesso e -1 se a matriz A não for definida positiva.
function cholrow(n, A) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    use, intrinsic :: ieee_arithmetic
    implicit none
    integer, intent(in) :: n
    real(dp) :: A(n,n)
    integer :: sucesso, i, j, k

    sucesso = 0
    do i=1,n
        do k=1,i-1
            A(i,i) = A(i,i) - A(i,k)**2
        enddo

        if (A(i,i) <= 0) then
            sucesso = -1
            exit
        endif

        A(i,i) = dsqrt(A(i,i))
        do j=i+1,n
            do k=1,i-1
                A(j,i) = A(j,i) - A(i,k)*A(j,k)
            enddo
            A(j,i) = A(j,i)/A(i,i)
        enddo
    enddo

end function cholrow

! Recebe um inteiro n, uma matriz triangular inferior A (nXn) e um vetor b (n)
! e devolve, no próprio b, a solução do sistema triangular inferior Ax=b.
! Devolve 0 se o sistema foi calculado com sucesso e -1 se a matriz A for
! singular.
function forwrow(n, A, b) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: A(n,n)
    real(dp):: b(n)
    integer :: sucesso

    sucesso = -1

end function forwrow

! Recebe um inteiro n, uma matriz triangular A (nXn), um vetor b (n) e um
! inteiro trans que vale 1 se A está transposta, 0 caso contrário. A função
! devolve, no próprio b, a solução do sistema triangular desejado, 0 se o
! sistema foi calculado com sucesso e -1 se a matriz A for singular.
function backrow(n, A, b, trans) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n, trans
    real(dp), intent(in) :: A(n,n)
    real(dp):: b(n)
    integer :: sucesso

    sucesso = -1

end function backrow

!---------------------------- 2 - SISTEMAS GERAIS ----------------------------!
!------------------------ FUNÇÕES ORIENTADAS A COLUNA ------------------------!

! Recebe um inteiro n e uma matriz A (nXn) e devolve, na própria A, as matrizes
! L e U da decomposição LU da matriz P A, onde P é a matriz de permutação
! obtida ao utilizar pivoteamento parcial. P deve ser devolvida no vetor p (n).
! A função também devolve 0 se a decomposição LU foi calculada com sucesso e -1
! se a matriz A for singular.
function lucol(n, A, p) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp) :: A(n,n), p(n)
    integer :: sucesso

    sucesso = -1

end function lucol

! Recebe um inteiro n e uma matriz A (nXn) e um vetor p (n) (ambos saída de
! lucol) e um vetor b (n) e devolve, no próprio b, a solução do sistema LUx=Pb;
! tal que Ly=Pb e Ux=y. A função também devolve 0 se o sistema foi resolvido
! com sucesso e -1 se a matriz U for singular.
function sscol(n, A, p, b) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: A(n,n), p(n)
    real(dp) :: b(n)
    integer :: sucesso

    sucesso = -1

end function sscol


!------------------------ FUNÇÕES ORIENTADAS A LINHA ------------------------!

! Recebe um inteiro n e uma matriz A (nXn) e devolve, na própria A, as matrizes
! L e U da decomposição LU da matriz P A, onde P é a matriz de permutação
! obtida ao utilizar pivoteamento parcial. P deve ser devolvida no vetor p (n).
! A função também devolve 0 se a decomposição LU foi calculada com sucesso e -1
! se a matriz A for singular.
function lurow(n, A, p) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp) :: A(n,n), p(n)
    integer :: sucesso

    sucesso = -1

end function lurow

! Recebe um inteiro n e uma matriz A (nXn) e um vetor p (n) (ambos saída de
! lurow) e um vetor b (n) e devolve, no próprio b, a solução do sistema LUx=Pb;
! tal que Ly=Pb e Ux=y. A função também devolve 0 se o sistema foi resolvido
! com sucesso e -1 se a matriz U for singular.
function ssrow(n, A, p, b) result(sucesso)
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer, intent(in) :: n
    real(dp), intent(in) :: A(n,n), p(n)
    real(dp) :: b(n)
    integer :: sucesso

    sucesso = -1

end function ssrow

!---------------------------------- TESTES ----------------------------------!

program ep2
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer :: n, k, i, j, sucesso
    integer :: cholcol, forwcol, backcol, cholrow, forwrow, backrow
    integer :: lucol, sscol, lurow, ssrow
    real(dp) :: a
    real(dp), allocatable :: M(:,:), x(:), p(:)
    real(kind=8)::start, finish
    
    read (*,*) n

    allocate(M(n,n))
    do k=1,n*n
        read (*,*) i, j, a
        if (i < 1 .or. j < 1 .or. i > n .or. j > n) then
            print *, "ERROR: Index out of bound"
        else
            M(i,j) = a
        endif
    enddo

    allocate(x(n))
    do k=1,n
        read (*,*) i, a
        if (i < 1 .or. i > n) then
            print *, "ERROR: Index out of bound"
        else
            x(i) = a
        endif
    enddo

    allocate(p(n))

    ! 1. SISTEMAS DEFINIDOS POSITIVOS
    call cpu_time(start)
    sucesso = cholcol(n, M)
    call cpu_time(finish)
    print *, "cholcol (", sucesso, "), duração: ", finish-start

    call cpu_time(start)
    sucesso = forwcol(n, M, x)
    call cpu_time(finish)
    print *, "forwcol (", sucesso, "), duração: ", finish-start

    call cpu_time(start)
    sucesso = backcol(n, M, x, 0)
    call cpu_time(finish)
    print *, "backcol (", sucesso, "), duração: ", finish-start

    call cpu_time(start)
    sucesso = cholrow(n, M)
    call cpu_time(finish)
    print *, "cholrow (", sucesso, "), duração: ", finish-start

    call cpu_time(start)
    sucesso = forwrow(n, M, x)
    call cpu_time(finish)
    print *, "forwrow (", sucesso, "), duração: ", finish-start

    call cpu_time(start)
    sucesso = backrow(n, M, x, 0)
    call cpu_time(finish)
    print *, "backrow (", sucesso, "), duração: ", finish-start

    ! 2. SISTEMAS GERAIS
    call cpu_time(start)
    sucesso = lucol(n, M, p)
    call cpu_time(finish)
    print *, "lucol (", sucesso, "), duração: ", finish-start

    call cpu_time(start)
    sucesso = sscol(n, M, p, x)
    call cpu_time(finish)
    print *, "sscol (", sucesso, "), duração: ", finish-start

    call cpu_time(start)
    sucesso = lurow(n, M, p)
    call cpu_time(finish)
    print *, "lurow (", sucesso, "), duração: ", finish-start

    call cpu_time(start)
    sucesso = ssrow(n, M, p, x)
    call cpu_time(finish)
    print *, "ssrow (", sucesso, "), duração: ", finish-start

    deallocate(M)
    deallocate(x)
    deallocate(p)

end program ep2
! NOME: Daniela Gonzalez Favero
! NUSP: 10277443
! Exercício Programa 2 - Resolu̧cão de sistemas de equações lineares

program ep2
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer :: n, k, i, j
    real(dp) :: a
    real(dp), allocatable :: M(:,:), x(:)
    
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

    deallocate(M)
    deallocate(x)

end program ep2
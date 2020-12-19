program generator
    use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none
    integer :: m, i, j
    real(dp) :: r, tau, aij

    read(*,*) m
    read(*,*) tau

    print *, m

    do i=1,m
        do j=1,i
            if (i == j) then
                aij = 1
                print *, i, i, aij
            else
                call random_number(r)
                aij = (2 * r - 1)

                if (abs(aij) > tau) then
                    aij = 0
                endif
                print *, i, j, aij
                print *, j, i, aij
            endif
        enddo
    enddo

    do i=1,m
        call random_number(r)
        aij = (2 * r - 1)
        print *, i, aij
    enddo

end program generator
program matriz
    integer,parameter :: n=3
    ! integer :: a(n,n)=transpose(reshape([1,2,3,4,5,6,7,8,9],shape(a)))
    integer :: a(n,n)=reshape([1,2,3,2,5,6,3,6,9],[3,3])
    logical :: simetrica=.true.
    print*,'a='
    do i=1,n
        do j=1,n
            print '(i0," ",$)',a(i,j)
        end do
        print*, ''
    end do
!-----------------------
    k=0
    do i=1,n
        k=k+a(i,i)
    end do
    print '("traza=",i0)',k
!-----------------------------------
    k=0
    do i=1,n-1
        k=k+sum(a(i,i+1:n))
    end do
    print '("suma triangulo superior=",i0)',k
!---------------------------------------
    filas: do i=1,n-1
        do j=i+1,n
            if(a(i,j)/=a(j,i)) then
                simetrica = .false.
                exit filas
            end if
        end do
    end do filas
    if (simetrica) then
        print*, 'matriz simetrica'
    else
        print*, 'matriz non simetrica'
    end if
end program matriz
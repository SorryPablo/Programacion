program polider
    integer,allocatable :: a(:)
    print '("n?",$)';read *,n
    allocate(a(0:n))
    print '("a(0:n)?",$)';read*,a
    open(1,file='polider.txt')
    print '("P(x)= ",$)'
    call ordena(a,n)
    do k=1,n
        call derivada(a,n,k)
    end do
    close(1)
end program polider

subroutine ordena(a,n)
    integer,intent(in) :: a(0:n),n
    do i=n,0,-1
        if(i==0) then
            print '(i0)',a(0)
        else if(i==1) then
            if(a(i)==1) then 
                print '("x + ",$)'
            else
                print '(i0,"x + ",$)',a(i)
            end if
        else
            if(a(i)==1) then 
                print '("x^",i0," + ",$)',i
            else
                print '(i0,"x^",i0," + ",$)',a(i),i
            end if
        end if
    end do
end subroutine ordena

subroutine derivada(a,n,k)
    integer,intent(in) :: a(0:n),n,k
    integer,allocatable :: b(:)
    integer :: p
    p=n-k
    allocate(b(0:p))
    do i=k,n
        !m=a(i)                              !Forma do
        !do j=0,k-1
        !    m=m*(i-j)
        !end do
        b(i-k)=a(i)*product([(i-j,j=0,k-1)]) !Forma vectorizada
    end do
    print '("P(x)^(",i0,")= ",$)',k
    !do i=0,p                                !Previo ordenamento,pero o arquivo non sae ben
    !    write (1,'(i0," ",$)') b(i)
    !end do
    call ordena(b,p) !Los ordena
    do i=p,0,-1                            !Despois do ordenamento
        write (1,'(i0," ",$)') b(i)
    end do
    write(1,*)
    deallocate(b)
end subroutine derivada
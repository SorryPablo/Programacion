program xullo
    integer,allocatable :: x(:),a(:,:)
    open(1,file='datos_fortran.txt',status='old',err=1)
    read (1,*) n,m
    k=n*m
    allocate(x(k),a(n,m))
    do i=1,n       
        read(1,*) a(i,:)
        do j=1,m
            print '(i5,$)',a(i,j)
        end do
        print*, ''      
    end do
    call non_repetidos(a,x,n,m,k,l)
    print '("Non repetidos:",i0)',l
    do i=1,l
        print '("Valor de x(i)=",i0,"Repeticiones=",i0)',x(i),count(a==x(i))
    end do
    close(1)
    deallocate(x,a)
    stop
1   stop 'erro no arquivo'
end program xullo

subroutine non_repetidos(a,x,m,n,k,l)
    integer,intent(in) :: a(n,m),n,m,k
    integer,intent(inout) :: x(k)
    integer,intent(out) :: l
    integer :: u
    l=0;v=1;u=0
    x()
    do i=1,n
        bucle: do j=1,m
            u=(i-1)*m+j
            if(all(x(1:u)/=a(i,j))) then
                l=l+1
                x(l)=a(i,j)
                exit bucle
            end if
        end do bucle
    end do
end subroutine non_repetidos
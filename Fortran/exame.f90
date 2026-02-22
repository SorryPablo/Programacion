program exame
    integer,allocatable :: x(:),y(:),z(:)
    open(1,file='exame.txt',status='old',err=1)
    read(1,*) n
    allocate(x(n),y(n),z(n))
    do i=1,n
        read(1,*) x(i),y(i)
    end do
    call subprog(x,y,z,n)
    
    print*, 'Vector z ='
    do i=1,n
        print '(" ",i0,$)',z(i)
    end do
    
    close(1)
    deallocate(x,y,z)
    stop
1   stop 'erro en open'    
end program exame
!--------------------
subroutine subprog(x,y,z,n)
    integer,intent(in) :: x(n),y(n),n
    integer,intent(out) :: z(n)
    integer :: u
    
    do i=1,n
        j=i;k=0;u=sum(y(1:i))
        do
            k=k+x(j)
            if(k>u) exit
            j=j+1
            if(j>n) j=1
        end do
        z(i)=y(j)
    end do

end subroutine subprog
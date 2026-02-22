program factores
    
    !Definicións------
    integer :: x
    integer,allocatable :: b(:),e(:)
    allocate(b(0),e(0))
    print '("x? ",$)'
    read*,x
    
    !Factorización------
    k=2;n=0
    print '("Factores de ",i0,":")',x
    do
        if(mod(x,k)==0) then
            b=[b,k];e=[e,1];n=n+1;x=x/k
            do while (mod(x,k)==0)
                e(n)=e(n)+1;x=x/k
            end do
        end if
        if(x==1) exit
        k=k+1
    end do
    
    !Imprimir------
    do i=1,n-1
        print'(i0,"^",i0,"*",$)',b(i),e(i)
    end do
    print'(i0,"^",i0)',b(n),e(n)
    deallocate(b,e)
end program factores
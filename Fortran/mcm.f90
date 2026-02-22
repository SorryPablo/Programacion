program principal
    integer :: x,y
    print '("x,y? ",$)'
    read*,x,y
    m=mcm(x,y)
    print '("mcm=",i0)',m

end program principal
!----------
function mcm(x,y)
    !Definicións e chamadas------
    integer,intent(in) :: x,y
    integer :: bx(100),ex(100),by(100),ey(100)
    call factores(x,bx,ex,nx) !Facemos a 'subroutine' para simplificar el cálculo.------
    call factores(y,by,ey,ny)
    mcm=x;
    
    !Bucle do------
    do i=1,ny
        k=by(i);l=ey(i)
        do j=1,nx
            if(k==bx(j)) then
                if(l>ex(j)) mcm=mcm*k**(l-ex(j))
                exit
            end if
        end do
        if (j>nx) mcm=mcm*k**l
    end do

    !Bucle vectorizado (findloc())------

    !do i=1,ny
    !    k=by(i);l=ey(i)
    !    if (any(k==bx(:nx))) then
    !        j=findloc(bx(:nx),k,1) !Busca o "j" para o que k==bx(:nx)------
    !        if (l>=ex(j)) mcm = mcm*k**(l-ex(j))         
    !    else
    !        mcm=mcm*k**l !Factor non común------
    !    end if
    !end do

end function mcm
!----------
subroutine factores(m,b,e,n)
    !Definicións------
    integer,intent(in) :: m
    integer,intent(out) :: b(*),e(*),n
    integer :: x
    
    !Factorización------
    k=2;n=0;x=m
    print '("Factores de ",i0,":")',m
    do
        if(mod(x,k)==0) then
            n=n+1;b(n)=k;e(n)=1;x=x/k
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
end subroutine factores
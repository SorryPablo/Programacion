program determinante
    integer,allocatable :: a(:,:)
    integer :: det !OJO,la funcion det() empieza por d(real) y debería ser entera 
    character(100) :: nome='matriz6.txt'
    open(1,file=nome,status='old',err=1)
    read(1,*) n !Leemos la dim(A)
    allocate(a(n,n))
    do i=1,n
        read(1,*) a(i,:)
    end do
    close(1)
    call imprime(a,n)
    m=det(a,n)
    print '("Det(a)=",i0)',m
    deallocate(a)
    stop !Solo imprime el error si salta desde 'err=1', fijese en el 1
1   print*,'erro open',nome
end program determinante
!-----------------------------
recursive integer function det(a,n) result(m)
    integer,intent(in) :: n,a(n,n)
    integer,allocatable :: b(:,:)
    integer :: p
    select case(n)
    case(:0)
        stop 'erro n<=0' !Si le pones caracteres detras entonces lo imprime
    case(1)
        m=a(1,1)
    case(2)
        m=a(1,1)*a(2,2)-a(1,2)*a(2,1)
    case default
        m=0;k=n-1;p=1
        do i=1,n
            b=a(2:n,[(j,j=1,i-1),(j,j=i+1,n)]) !Creamos la matriz adjunta
            call imprime(b,k)                  !Lee los valores de la matriz adjunta
            m=m+p*a(1,i)*det(b,k);p=-p         !Suma las matrices adjuntas
        end do
    end select
end function
!-----------------------------
subroutine imprime(a,n)
    integer,intent(in) :: a(n,n),n
    do i=1,n
        do j=1,n
            print '(i0," ", $)',a(i,j)
        end do
        print * !Pasa a linea seguinte
    end do
    print*,'-----------------'
end subroutine
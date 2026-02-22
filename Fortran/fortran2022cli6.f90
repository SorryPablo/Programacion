program cli6
    integer,parameter :: n=3
    integer :: a(n,n)=reshape([1,2,3,4,5,6,7,8,9],[3,3]),suma_impar,res
    real :: s(n),u(n),suma
    do i=1,n
        do j=1,n
            print '(i3,$)',a(i,j)
        end do
        print*,''
    end do
    res=suma_impar(a,n)
    print*,res
    open(1,file="datos6.txt")
    suma=sum(a)
    do i=1,n
        u(i)=suma/i
        do j=1,n
            if(j<=i) then
                s(i)=s(i)+a(i,j)
            elseif (j>i) then
                s(i)=s(i)+a(j,i)
            end if
        end do
        write(1,*) i,s(i),u(i)
    end do
end program cli6
!-------------------
integer function suma_impar(a,n) result(res)
    integer,intent(in) :: a(n,n),n
    res=0
    do i=1,n
        do j=1,n
            if(mod(a(i,j),2)==1) then
                res=res+(i+j)*a(i,j)
            end if
        end do
    end do
end function suma_impar
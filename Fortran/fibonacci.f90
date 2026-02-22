program fibonacci
    integer :: f0=0, f1=1, f2
    do
        print*,'"n(>1)?",$'
        read*,n
        if (n>1) exit
    end do
    print*,'f0=0'
    print*,'f1=1'
    do i=2,n
        f2=f1+f0
        print '("f",i0,"=",i0)',i,f2
        f0=f1
        f1=f2
    end do
end program fibonacci